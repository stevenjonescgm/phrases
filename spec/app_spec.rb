require 'spec_helper'
require_relative '../app/app'

# # Use timeout to ensure app doesn't soft-lock (or stall awaiting STDIN)
require 'timeout'

describe 'App' do
  subject(:app) { App.new }
  # Use timeout to ensure app doesn't soft-lock (or stall awaiting STDIN)
  around do |example|
    Timeout.timeout(5) do
      example.run
    end
  end

  context 'from file source' do
    it 'runs provided files moby-dick.txt, brothers-karamazov.txt' do
      skip 'covered in system test solution_spec.rb'
    end
  end

  it 'consumes text from STDIN/StringIO' do
    skip 'covered by system test solution_spec.rb'
  end

  context 'trivial single source' do
    it 'parses basic phrase' do
      source = %w[some basic phrase]
      expect(app.run(source)).to eq({ 'some basic phrase' => 1 })
    end

    # insignificant of the Pequod’s crew; an event most lamentable
    it 'parses phrase with unicode quote (’)' do
      source = %w[of the Pequod’s crew]
      expect(app.run(source)).to eq({
                                          'of the pequod’s' => 1,
                                          'the pequod’s crew' => 1,
                                        })
    end
  end

end
