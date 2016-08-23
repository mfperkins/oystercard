require 'oystercard'

describe Oystercard do

  let(:entry_station) { double :entry_station }
  let(:entry_station2) { double :entry_station2 }
  let(:exit_station) { double :exit_station }
  let(:journey) { double :journey, fare: 1 }

  context 'when initialized' do
    it 'has a balance of 0' do
      expect(subject.balance).to eq(0)
    end

    it 'has an empty list of journeys' do
      expect(subject.journeys).to be_empty
    end
  end

  describe '#top_up' do
    it 'increases balance by amount' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    context 'balance is greater than max limit' do
      it 'raises an error' do
        message = "balance cannot exceed £#{Oystercard::DEFAULT_MAX}"
        expect{subject.top_up(Oystercard::DEFAULT_MAX+10)}.to raise_error message
      end
    end
  end

  describe '#touch_in' do
    context 'balance is less than min fare' do
      it 'raises an error' do
        message = 'balance less than £1 - please top up'
        expect{subject.touch_in(entry_station)}.to raise_error message
      end
    end

  end

  context 'for cases where there is a complete journey' do

    before(:each) do
      subject.top_up(10)
      subject.touch_in(entry_station)
    end

    it 'deducts minimum fare from oyster' do
      expect {subject.touch_out(exit_station)}.to change{subject.balance}.by(-1)
    end

    it 'remembers a full journey' do
      subject.touch_out(exit_station)
      expect(subject.journeys).to include(:entry_station => entry_station, :exit_station => exit_station)
    end
  end

  context 'for cases where there is an exit station but no entry station' do

    before(:each) do
      subject.top_up(10)
    end

    it 'will charge you a penalty fare if you touch out' do
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-6)
    end

  end

  context 'for cases where there is an entry station but no exit station on the previous journey' do

    before(:each) do
      subject.top_up(10)
      subject.touch_in(entry_station)
    end

    it 'will charge you a penalty fare if you touch in' do
      expect{subject.touch_in(entry_station2)}.to change{subject.balance}.by(-6)
    end

  end

end
