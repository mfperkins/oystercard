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

  xit 'ends a journey' do

  end

  xit 'records a journey' do

    end

  end

  end
