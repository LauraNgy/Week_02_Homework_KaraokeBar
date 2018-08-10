class Song

  attr_reader :name, :tune
  attr_accessor :price

  def initialize(name, tune)
    @name = name
    @tune = tune
    @price = 1
  end

end
