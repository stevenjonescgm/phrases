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

    # STDIN.readlines
    # TODO: go to scale by reading bytes rather than lines
    # For starters, read by line.
    @stream.each do |terms|
      # To get to near-word streaming, I prioritized splitting on whitespace ' ' instead of newline
      # So terms could include newlines
      #   (which turns out useful for hyphen line endings)

      # make case insensitive
      terms = terms.downcase

      # clean up punctuation and newlines
      # convert hyphen line-endings
      terms = terms.gsub(/-\n/, '')

      # strip punctuation and newlines (inverted, so select words including contractions)
      # terms = terms.gsub(/(?!\w'\w|\w)/)
      cleaned = /((?:\w'\w)|\w)+/.match terms

      # puts cleaned
    end


  end
end
