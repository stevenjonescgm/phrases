require 'spec_helper'
# # Use timeout to ensure app doesn't soft-lock (or stall awaiting STDIN)
require 'timeout'

describe 'solution.rb' do
  # Use timeout to ensure app doesn't soft-lock (or stall awaiting STDIN)
  around do |example|
    Timeout.timeout(5) do
      example.run
    end
  end

  it 'prints usage if no text (nor pipe)' do
    status = `ruby solution.rb`
    expect(status).to eq <<~HELP
       Usage: solution.rb [options] [filename ...]
           -v, --[no-]verbose               Run verbosely
    HELP
  end

  it 'runs by default' do
    status = `echo "simple string" | ruby solution.rb`
    expect(status).to eq ''
  end

  it 'runs by pipe (minimum 3 words)' do
    status = `echo "a simple string" | ruby solution.rb`
    expect(status).to eq "a simple string - 1\n"
  end

  it 'runs provided file' do
    output = `ruby solution.rb texts/moby-dick.txt`
    expect(output).to eq <<~OUTPUT
      of the whale - 93
      the sperm whale - 89
      the white whale - 76
      one of the - 64
      of the sea - 60
      out of the - 58
      project gutenberg tm - 56
      a sort of - 53
      part of the - 53
      of the sperm - 43
      it was a - 33
      in the sea - 32
      it is a - 30
      of the ship - 30
      the project gutenberg - 30
      for a moment - 29
      of the boat - 29
      the sperm whale’s - 28
      the right whale - 27
      to the deck - 27
      the sea and - 26
      at the same - 25
      by no means - 25
      for the time - 25
      in order to - 25
      in the air - 24
      so as to - 24
      the bottom of - 24
      the quarter deck - 24
      the same time - 24
      to be the - 24
      must have been - 23
      of the pequod - 23
      on the sea - 23
      that in the - 23
      at the time - 22
      in the fishery - 22
      into the sea - 22
      it was that - 22
      now and then - 22
      out of sight - 22
      there is no - 22
      it was the - 21
      the whale and - 21
      there was a - 21
      and in the - 20
      as it were - 20
      it was not - 20
      and all the - 19
      and at the - 19
      as if it - 19
      as well as - 19
      down into the - 19
      into the air - 19
      of the whale’s - 19
      one of those - 19
      so that the - 19
      up to the - 19
      and with a - 18
      bottom of the - 18
      end of the - 18
      gutenberg tm electronic - 18
      i do not - 18
      in his own - 18
      it is not - 18
      it is that - 18
      of a whale - 18
      the old man - 18
      the whale is - 18
      but it was - 17
      down in the - 17
      down to the - 17
      of the white - 17
      over the side - 17
      round and round - 17
      the mast head - 17
      the pequod was - 17
      the ship and - 17
      to and fro - 17
      all the time - 16
      of the world - 16
      the head of - 16
      the old man’s - 16
      to be sure - 16
      whale and the - 16
      you would have - 16
      and as for - 15
      he seemed to - 15
      he was a - 15
      him in the - 15
      in the same - 15
      it is the - 15
      it was only - 15
      more and more - 15
      of his head - 15
      of the great - 15
      of the leviathan - 15
      on the other - 15
      owing to the - 15
      side of the - 15
    OUTPUT
  end

  it 'runs trivial file' do
    output = `ruby solution.rb spec/trivial_sample.txt`
    expect(output).to eq <<~OUTPUT
      some basic data - 3
      across lines another - 2
      another across lines - 2
      data some basic - 2
      another should've phrase - 1
      basic data another - 1
      basic data other - 1
      basic data some - 1
      data another across - 1
      data other data - 1
      lines another across - 1
      lines another should've - 1
      other data some - 1
    OUTPUT

  end
end
