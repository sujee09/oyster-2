require 'oystercard'

describe Oystercard do
  subject = Oystercard.new
  it 'balance to be zero' do
    expect(subject.balance).to eq(0)
  end
end
