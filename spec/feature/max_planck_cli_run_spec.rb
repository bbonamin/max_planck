require 'spec_helper'

describe 'Max Planck CLI Run' do
  it 'takes a file input and prints the maximum area rectangle' do
    output = `bundle exec max_planck spec/support/plank-1.txt`
    expect(output).to match(/18/)
  end

  it 'prints an error if no file path is provided' do
    output = `bundle exec max_planck`
    expect(output).to match(/Error:/)
  end

  it 'prints an error if the file path is invalid' do
    output = `bundle exec max_planck foo`
    expect(output).to match(/Error:/)
    expect(output).to match(/File path is invalid/)
  end
end
