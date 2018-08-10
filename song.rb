class Song

  attr_reader :name, :tune, :price

  def initialize(name, tune)
    @name = name
    @tune = tune
    @price = 1
  end

end
