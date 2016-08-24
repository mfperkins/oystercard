require 'journey'

# Let's create a new Journey class, it should be responsible for starting a journey, finishing a journey,
# calculating the fare of a journey, and returning whether or not the journey is complete.

describe Journey do

  subject(:journey) { described_class.new ("Bank") }
  subject(:journey_nil) {described_class.new}
  let(:card) { double :oystercard }

  describe '#initialize' do
    it 'initializes with an recorded entry station' do
      expect(journey.entry_station).to eq "Bank"
    end
  end

  describe '#finish_journey' do
    it 'records total journey' do
      expect(journey.finish_journey("Aldgate")).to eq({ :entry_station => "Bank" , :exit_station => "Aldgate" })
    end
  end

  describe '#fare' do
    it "charges mimumum fare on full journey" do
      journey.finish_journey("Aldgate")
      expect(journey.fare).to eq(Journey::MINIMUM_FARE)
    end

    it "charges penalty fare on missing exit station" do
      expect(journey.fare).to eq(Journey::PENALTY_FARE)
    end

    it "charges penalty fare on missing entry station" do
      expect(journey_nil.fare).to eq(Journey::PENALTY_FARE)
    end
  end


end
