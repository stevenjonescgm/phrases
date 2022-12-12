require 'spec_helper'

describe 'solution.rb' do
  # Use timeout to ensure app doesn't soft-lock (or stall awaiting STDIN)
  around do |example|
    Timeout.timeout(5) do
      example.run
    end
  end

  it 'runs by default' do
    skip 'figure out how to handle no-input later'
    status = system 'ruby solution.rb'
    expect(status).to eq true
  end

  it 'runs by default' do
    status = system 'echo "simple string" | ruby solution.rb'
    expect(status).to eq true
  end

  it 'runs provided file' do
    skip 'start tests with small file to not waste time'
    status = system 'ruby solution.rb moby-dick.txt'
    expect(status).to eq true
  end

  it 'runs trivial file' do
    status = system 'ruby solution.rb spec/trivial_sample.txt'
    expect(status).to eq true
  end
end
