# use active_support for convenience, before considering removal for performance
require 'active_support'
# develop with a timeout for
require 'timeout'

class App
  attr_accessor :stream, :options

  def initialize(stream, options = {})
    @stream = stream
    @options = options
  end

  def run
    puts "options: #{options}" if options[:verbose]
    # puts @stream.read
    @stream.read
  end
end
