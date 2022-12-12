# phrases/solution.rb is a cli script
#   receives a filename or text stream
#   prints the 100 most common three word sequences in descending order of frequency


# optparse for starting a decent UX around a command line executable
require 'optparse'

require_relative 'app/app'


options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: solution.rb [options] [filename]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!

# p options
# p ARGV

@filename = ARGV[0]
@stream = if @filename # a filename was provided
  unless File.exists?(@filename )
    puts "Invalid filename '#{@filename }'"
    exit -1
  end
  File.open(@filename )
else # expect input from stdin
  STDIN
end

phrases = App.new(@stream, options).run
puts phrases
