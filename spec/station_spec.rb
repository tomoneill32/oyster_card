require 'station'

describe Station do

  subject { described_class.new(name: "station_name", zone: 1)}

  it 'returns its zone' do
    expect(subject.zone).to eq(1)
  end

  it 'returns its name' do
    expect(subject.name).to eq("station_name")
  end

end