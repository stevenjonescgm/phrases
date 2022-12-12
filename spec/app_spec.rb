require 'spec_helper'
require_relative '../app/app'

# # Use timeout to ensure app doesn't soft-lock (or stall awaiting STDIN)
# require 'timeout'

describe 'App' do
  # Use timeout to ensure app doesn't soft-lock (or stall awaiting STDIN)
  around do |example|
    Timeout.timeout(5) do
      example.run
    end
  end

  context 'from file source' do
    it 'runs provided file' do
      skip 'start tests with small file to not waste time'
      file = File.open('moby-dick.txt')
      app = App.new(file)
      expect(app.run).to eq(nil)
    end

    it 'runs trivial sample' do
      skip 'App now returns a data structure for CLI to print'
      file = File.open('spec/trivial_sample.txt')
      app = App.new(file)
      expect(app.run).to eq({
                              "some basic data" => 3,
                              "another across lines" => 2,
                            })
    end
  end

  context 'from STDIN/StringIO' do
    it 'parses basic phrase' do
      source = %w[some basic phrase]
      expect(App.new(source).run).to eq({ 'some basic phrase' => 1 })
    end
  end

end
