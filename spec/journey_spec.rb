require 'journey'

describe Journey do
  let(:station) {double :station, zone: 1}
  subject(:journey) { described_class.new(station: station)}


  it 'has an entry station' do
    expect(subject.entry_station).to eq station
  end

describe '#finish ' do

  it 'return exit station when journey finishes' do
    expect(subject.finish(station)).to eq station
  end

  it 'calculates the fare' do
    expect(subject.fare).to eq 1
  end

  it 'knows if a journey is complete' do
    expect(subject).to be_complete
  end

  it 'it gives a default penalty fare by default' do
    expect(subject.fare).to Journey::PENALTY_FARE
  end

  end

  end
