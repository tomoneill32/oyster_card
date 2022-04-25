describe Oystercard do

  def top_up_card
    subject.top_up(20)
  end

  describe '#check_balance' do
    it 'returns default value' do
      expect(subject.check_balance).to eq(0)
    end
  end

  describe 'top_up' do
    it 'will increase the balance on the card by the amount specified' do
      expect{ subject.top_up(5) }.to change{ subject.check_balance }.by(5)
    end

    it 'will not allow the balance to go above the maximum allowed' do
      max_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up(1) }.to raise_error("Maximum balance #{max_balance} exceeded")
    end
  end

  describe 'deduct' do
    it{ should respond_to(:deduct).with(1) }

    it 'Should reduce the balance on the card by the fare' do
      top_up_card
      expect{subject.deduct(5)}.to change{ subject.check_balance }.by(-5)
    end
  end

  describe '#in_journey?' do
    it { should respond_to(:in_journey?) }

    it 'should return whether the card is in use' do
      expect(subject.in_journey?).to be(true).or be(false)
    end
  end

  describe '#touch_in' do
    it { should respond_to(:touch_in) }

    it 'should change card to be in use' do
      expect { subject.touch_in }.to change { subject.in_journey? }.from(false).to(true)
    end
  end

  describe '#touch_out' do
    it { should respond_to(:touch_out) }

    it 'should change card to not be in use' do
      subject.touch_in
      expect { subject.touch_out }.to change { subject.in_journey? }.from(true).to(false)
    end
  end
end
