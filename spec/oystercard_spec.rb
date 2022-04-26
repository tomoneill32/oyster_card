describe Oystercard do

  let(:station){ double :station}

  def top_up_card
    subject.top_up(20)
  end

  describe '#check_balance' do
    it 'returns default value' do
      expect(subject.check_balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'will increase the balance on the card by the amount specified' do
      expect{ subject.top_up(5) }.to change{ subject.check_balance }.by(5)
    end

    it 'will not allow the balance to go above the maximum allowed' do
      max_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up(1) }.to raise_error("Maximum balance #{max_balance} exceeded")
    end
  end

  describe '#touch_in' do

    it 'should change card to be in use' do
      top_up_card
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'should not let you touch in with a balance below £1' do
      minimum_balance_to_travel = Oystercard::MINIMUM_BALANCE_TO_TRAVEL 
      expect{subject.touch_in(station)}.to raise_error "Insufficient funds - balance below #{minimum_balance_to_travel}"
    end

  end

  describe '#touch_out' do
    it { should respond_to(:touch_out) }

    it 'should change card to not be in use' do
      top_up_card
      subject.touch_in(station)
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'should deduct the minimum fare from the card' do
      top_up_card
      subject.touch_in(station)
      expect { subject.touch_out}.to change { subject.check_balance }.by(-Oystercard::MINIMUM_FARE)
    end
    
  end

  it 'stores the entry station' do
    top_up_card
    subject.touch_in(station)
    expect(subject.entry_station).to eq(station)
  end

end
