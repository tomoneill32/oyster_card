describe Oystercard do
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

end