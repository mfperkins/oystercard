require 'station'

describe Station do

    subject {described_class.new("Aldgate", 1)}

    it 'should give the name of the station' do
      expect(subject.name).to eq("Aldgate")
    end

    it 'should give the zone' do
      expect(subject.zone).to eq (1)
    end
end
