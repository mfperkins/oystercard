require 'journeylog'

describe JourneyLog do

  let(:station) {double :station}
  let(:station2){double :station}
  let(:Journey_class) {double :Journey_class, new: journey}
  let(:journey) {double :journey, start: nil, finish: nil}

  it 'checks that the card has an empty list of journeys' do
    expect(subject.journeys).to be_empty
  end

xit 'send station to journeylog' do
  subject.start(station)
  expect(journey).to have_received(:start).with(station)
end

xit 'sends station to Journey' do
  subject.start(station)
  subject.finish(station)
  expect(journey).to have_received(:finish).with(station)
end

it 'checks that touching in and out creates one journey' do
  subject.start(station)
  subject.finish(station2)
  expect(subject.journeys).to include(entry_station: station, exit_station: station2)
end


end
