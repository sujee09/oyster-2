require 'oystercard'

describe Oystercard do
  subject = Oystercard.new
  it 'balance to be zero' do
    expect(subject.balance).to eq(0)
  end

  it 'adds money to the card' do
    expect(subject).to respond_to :top_up
  end

  it 'adds money to the balance' do
    expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
  end
end
