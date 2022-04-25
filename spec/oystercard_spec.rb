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


end