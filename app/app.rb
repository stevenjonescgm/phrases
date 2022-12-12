# use active_support for convenience, before considering removal for performance
require 'active_support'

class App
  attr_accessor :options, :phrases

  def initialize(options = {})
    @options = options

    # Simple array to track phrases across text(s) ingestion
    # until 3rd word is ingested,
    #   contains 0, 1, 2, or 3 words
    # after 3rd word is ingested,
    #   first word will pop off and newest word will be added.
    @last_phrase = []

    # Simple hash, with keys being three-word-sequences like ['the', 'sperm', 'whale']
    # and values being the number of times the phrase occurs
    @phrases = Hash.new(0)
  end

  def run(text)
    puts "options: #{options}" if options[:verbose]

    # STDIN.readlines
    # TODO: go to scale by reading bytes rather than lines
    # For starters, read by line.
    text.each do |terms|
      words = normalize_words(terms)
      words.each do |word|
        ingest(word)
      end
    end

    @phrases
  end

  def inspect
    [@options, @last_phrase.join(" "), @phrases.first(3)].join("\n")
  end

  private

  def normalize_words(terms)
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
    # TODO: consider double-contractions, such as "they'd've" which this treats as
    # ["they'd", "ve"]
    terms = terms.scan(/((?:\w['’]\w|\w)+)/)

    # NOTE: static style analysis dislikes this, but it keeps git history more clean
    #noinspection RubyUnnecessaryReturnValue
    terms
  end

  def ingest(word)
    @last_phrase << word

    # TODO: refactor .length calculation as unnecessary after @primed = true
    case @last_phrase.length
    when 3
      @primed = true
    when 4
      @last_phrase.shift
    else # 0, 1, 2
      # not yet primed
    end

    if @primed
      @phrases[@last_phrase.join(' ')] += 1
    end
  end
end
