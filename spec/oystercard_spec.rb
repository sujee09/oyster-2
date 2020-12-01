require 'oystercard'

describe Oystercard do
  subject(:card) { Oystercard.new }
  it 'balance to be zero' do
    expect(card.balance).to eq(0)
  end

  it 'has a deafult balance' do
    expect(card.balance).to eq Oystercard::DEFAULT_BALANCE
  end

  # describe '#deduct' do
  #   it 'deducts the fare from your card' do
  #     expect(card).to respond_to(:deduct)
  #     expect { card.deduct }.to change { card.balance }.by(-Oystercard::FARE)
  #   end
  # end

  describe '#in_journey' do
    it 'shows whether user in journey' do
      expect(card).to respond_to(:in_journey?)
    end
  end

  describe '#touch_in' do
    it 'touches-in the user to begin journey' do
      expect(card).to respond_to(:touch_in).with(1).argument
    end

    it 'raises an error if balance is less than min. fare' do
      card.top_up(0.5)
      expect { card.touch_in("Putney") }.to raise_error "Balance is too low - it's less than £#{Oystercard::MIN_BALANCE} min. fare"
    end

   # let(:station){ double :station }
    it 'stores station where card was touched in' do
      card.top_up(10)
      card.touch_in("Putney")
      expect(card.entry_station).to eq("Putney")
    end

  end

  describe '#touch_out' do
    it 'touches-out the user as the complete their journey' do
      expect(card).to respond_to(:touch_out).with(1).argument
    end

    it 'stores the exit station' do
      card.top_up(10)
      card.touch_in("Putney")
      card.touch_out("Balham")
      expect(card.exit_station).to eq("Balham")
    end

    it 'deducts the correct fare at the end of the journey' do
      expect { card.touch_out("Balham") }.to change { card.balance }.by(-Oystercard::FARE)
    end
  end

  describe '#top_up' do
    it 'adds money to the card' do
      expect(card).to respond_to :top_up
    end

    it 'raises an error when top up is greater than maximum balance' do
      card.top_up(50)
      expect { card.top_up(41) }.to raise_error "£#{Oystercard::MAX_BALANCE} Max. Value Exceeded"
    end

    it 'adds money to the balance' do
      expect { card.top_up(5) }.to change { card.balance }.by 5
    end
  end
end
