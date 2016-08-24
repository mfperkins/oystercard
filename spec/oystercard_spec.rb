require 'oystercard'

describe Oystercard do
    subject(:oystercard) {described_class.new}

    let(:entry_station) {double :entry_station}
    let(:exit_station) {double :exit_station}
    let(:journey) {double :journey}


  describe 'initialize' do
    it 'card has a balance of zero' do
      expect(oystercard.balance).to eq 0
    end

    it "is able to store journey history" do
      expect(oystercard.journeys).to eq []
    end
  end


  describe '#top_up' do
    context 'when under limit' do

    it 'can increase the balance' do
      expect{oystercard.top_up 10}.to change{oystercard.balance}.by 10
    end
  end

    context 'when over limit' do
    it 'raises an error when more than £90 is added' do
      LIMIT = Oystercard::LIMIT
      oystercard.top_up(LIMIT)
      expect{ oystercard.top_up 5 }.to raise_error "Limit £#{LIMIT} exceeded"
    end
  end
  end

  context 'when travelling' do

    describe '#touch_in' do

      context 'When balance is less than £1' do
        it 'raises an error' do
          expect { oystercard.touch_in(entry_station) }.to raise_error 'not enough credit'
        end
      end
    end

   describe '#touch_out' do

     it "stores an entry and exit station to the journey history on the card" do
       oystercard.top_up(10)
       oystercard.touch_in(entry_station)
       oystercard.touch_out(exit_station)
       expect(oystercard.journeys).to include ({:entry_station => entry_station, :exit_station =>exit_station})
     end

     it "charges the min fare" do
       subject.top_up(10)
       subject.touch_in(entry_station)
       expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-1)
     end


   end
 end
end
