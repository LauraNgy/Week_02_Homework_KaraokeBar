class Song

  attr_reader :name, :tune, :price

  def initialize(name, tune)
    @name = name
    @tune = tune
    @price = 1
  end

  def ammend_price(num)
    @price = num
  end

end
