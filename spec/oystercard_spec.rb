require 'oystercard'

describe Oystercard do
  subject(:card) {Oystercard.new}
  it 'balance to be zero' do
    expect(card.balance).to eq(0)
  end

  it 'has a deafult balance' do
    expect(card.balance).to eq Oystercard::DEFAULT_BALANCE
  end
 
  describe '#deduct' do
    it 'deducts the fare from your card' do
      expect(card).to respond_to(:deduct).with(1).argument 
      expect{ card.deduct 4 }.to change { card.balance }.by -4
    end

  end

  describe '#top_up' do
    it 'adds money to the card' do
      expect(card).to respond_to :top_up
    end 
  
    it 'raises an error when top up is greater than maximum balance' do
      card.top_up(50)
      expect{ card.top_up(41) }.to raise_error "£#{Oystercard::MAX_BALANCE} Max. Value Exceeded"
    end

    it 'adds money to the balance' do
      expect{ card.top_up(5) }.to change{ card.balance }.by 5
    end

  end

end
