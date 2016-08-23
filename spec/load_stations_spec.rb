require 'load_stations'

describe LoadStations do

  describe '#initialize' do

    it 'should load the specified file' do
      expect(subject.filename).to eq 'stations.csv'
    end

    

  end

  # describe '#File.open' do
  #    it 'should open the specified file'
  #    file = stations.csv
  #    expect(File.open).to eq
  # end

end
