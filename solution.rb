# phrases/solution.rb is a cli script
#   receives a filename or text stream
#   prints the 100 most common three word sequences in descending order of frequency

# optparse for starting a decent UX around a command line executable
require 'optparse'

require_relative 'app/app'

options = {}
option_parser = OptionParser.new do |opts|
  opts.banner = "Usage: solution.rb [options] [filename ...]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end
option_parser.parse!

@filenames = ARGV[0..-1]

@texts = []
if @filenames.any?
  # one or more filenames were provided
  @filenames.each do |filename|
    unless File.exists?(filename)
      puts "Invalid filename '#{filename}'"
      exit -1
    end
    @texts << File.readlines(filename, ' ')
  end
elsif !STDIN.tty? # expect input from stdin
  @texts << STDIN.readlines(' ')
else
  puts option_parser.help
  exit
end

app = App.new(options)
@texts.each do |text|
  app.run(text)
end

phrases = app.phrases

# TODO: consider providing texts to App after initialization
# TODO: consider moving sorting (and top 100) into App
phrases = phrases.sort_by { |_phrase, count| -count }.first(100)

phrases.each do |sequence, count|
  if options[:verbose]
    # Turns out the suggested output for task includes counts
    # But let's keep a verbose branch to reuse/extend/test later
    # TODO: pre-evaluate verbose to run a different formatter instead of evaluating condition each word
    puts "#{sequence} => #{count}"
  else
    puts "#{sequence} - #{count}"
  end
end
