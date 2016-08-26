require 'journey'

describe Journey do
  let(:station) {double :station, zone: 1}
  let(:station2) {double :station2, zone: 1}

  describe '#start' do

    it 'has an entry station' do
      subject.start(station)
      expect(subject.entry_station).to eq station
    end

  end

  describe '#finish ' do

    it 'record exit station when journey finishes' do
      subject.finish(station2)
      expect(subject.exit_station).to eq station2
    end

  end

  describe '#fare' do

    it 'calculates the fare' do
      subject.start(station)
      subject.finish(station2)
      expect(subject.fare).to eq Journey::MIN_FARE

    end
    it 'it gives a penalty fare by default and when no exit station' do
      subject.finish(station)
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'it gives a penalty fare when no entry station' do
      subject.start(station)
      subject.start(station2)
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

  end

  describe '#complete' do

    it 'knows if a journey is complete' do
      subject.start(station)
      subject.finish(station2)
      expect(subject).to be_complete
    end

    it 'knows if a journey is incomplete' do
      expect(subject.complete?).to be false
    end

  end

end
