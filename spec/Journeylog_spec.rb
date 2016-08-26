require "Journeylog"

describe Journeylog do

  let(:journey_class) {double :journey_class, new: journey}
  let(:journey) {double :journey, start: station}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}


  it "is able to start a journey" do
    expect(subject).to respond_to(:start)
  end

  it "is able to finish a journey" do
    expect(subject).to respond_to(:finish)
  end

  it "expects journey history to be empty" do
    expect(subject.journeys).to be_empty
  end

  it 'add a incomplete journey to journey history' do
    subject.start(entry_station)
    subject.finish(exit_station)
    expect(subject.journeys).to include({ :entry_station => entry_station , :exit_station => exit_station })
  end

  # it "recieves correct fare" do
  #   expect(subject.fare).to
  # end
  #
  # it 'add a incomplete journey to journey history' do
  #   card.touch_in(entry_station)
  #   card.touch_in(entry_station)
  #   expect(card.journeys).to include({ :entry_station => entry_station , :exit_station => nil })
  # end

  # it 'records incomplete journey in journey history' do
  #   card.touch_out(exit_station)
  #   expect(card.journeys).to include({ :entry_station => nil , :exit_station => exit_station })
  # end

  it 'forgets entry_station on touch out' do
    subject.start(entry_station)
    subject.finish(exit_station)
    expect(subject.journey).to eq nil
  end

end
