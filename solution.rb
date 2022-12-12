# phrases/solution.rb is a cli script
#   receives a filename or text stream
#   prints the 100 most common three word sequences in descending order of frequency


# optparse for starting a decent UX around a command line executable
require 'optparse'

# use active_support for convenience, before considering removal for performance
require 'active_support'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: solution.rb [options] [filename]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!

# p options
# p ARGV


class App
  attr_accessor :filename, :options

  def initialize(filename = nil, options = {})
    @filename = filename.presence
    @options = options
  end

  def run
    puts filename
    puts options
  end
end

App.new(ARGV[0], options).run
