require 'oystercard'

describe Oystercard do
let (:station) {double :station}
let (:station2) {double :station2}

  describe '#initialize' do
    it 'should set a card to a default balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'should allow user to set a custom balance' do
      loaded_card = Oystercard.new(50)
      expect(loaded_card.balance).to eq 50
    end

    it 'should have no journeys stored by default' do
      expect(subject.journeys).to eq []
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
      expect{subject.touch_out(station)}.to change {subject.balance}.by -Oystercard::MIN_FARE
    end

    it 'should create a hash of the journey and store it in the "journeys" variable' do
      subject.touch_out(station2)
      expect(subject.journeys).to include(station => station2)
    end

    it 'should create and store 2 journeys in the journey array when used 2x' do
      subject.touch_out(station2)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.journeys.count).to eq 2
    end
  end
end
