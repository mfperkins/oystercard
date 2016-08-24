require 'journey'

describe Journey do
  let(:station) {double :station, zone: 1}
  subject(:journey) { described_class.new(station: station)}




  it 'has an entry station' do
    expect(subject.entry_station).to eq station
  end

  xit 'ends a journey' do

  end

  xit 'records a journey' do

  end

  xit 'calculates the fare' do

  end

  end
