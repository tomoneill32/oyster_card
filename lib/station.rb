class Station

  def initialize (information)
    @information = information
  end

  def name
    @information[:name]
  end

  def zone
    @information[:zone]
  end

end