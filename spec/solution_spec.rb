require 'spec_helper'

describe 'solution.rb' do
  it 'runs by default' do
    status = system 'ruby solution.rb'
    expect(status).to eq true
  end

  it 'runs by default' do
    status = system 'ruby solution.rb moby-dick.txt'
    expect(status).to eq true
  end
end
