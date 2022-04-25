describe Oystercard do
  describe '#check_balance' do
    it 'returns default value' do
      expect(subject.check_balance).to eq(0)
    end
  end
end