require 'oystercard'

describe Oystercard do
let (:station) {double :station}

  describe '#initialize' do
    it 'should set a card to a default balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'should allow user to set a custom balance' do
      loaded_card = Oystercard.new(50)
      expect(loaded_card.balance).to eq 50
    end
  end

  describe '#top_up' do
    it 'should change the balance as the top up amount' do
      expect{subject.top_up(50)}.to change{ subject.balance }.by 50
    end

    it 'should raise and error if we try to load over max limit' do
      maximum_balance = Oystercard::MAX_LIMIT
      msg = "You can't top-up over #{maximum_balance}"
      expect{subject.top_up(maximum_balance)}.to raise_error(msg)
    end
  end

  describe '#touch_in' do

    it 'should not touch in if balance is below minimum fare amount' do
      min_fare = Oystercard::MIN_FARE
      msg = "Your balance is below #{min_fare}"
      expect{subject.touch_in(station)}.to raise_error(msg)
    end

    it 'should record the entry station' do
      subject.top_up(5)
      expect{subject.touch_in(station)}.to change{subject.entry_station}.to station
    end
  end

  describe '#touch_out' do
    before do
      subject.top_up(5)
      subject.touch_in(station)
    end

    it 'should reduce the balance by the mimimum fare' do
      expect{subject.touch_out}.to change {subject.balance}.by -Oystercard::MIN_FARE
    end

    it 'should forget the entry station' do
      expect{subject.touch_out}.to change {subject.entry_station}.to nil
    end
  end
end
