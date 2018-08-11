class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def check_favourite_song(name, song_list)
    song_list.each {|song|
    if song.name == name
      return "Whoop"
    else
      return "Awww"
    end}
  end

  def pay_song_fee(song)
    @wallet -= song.price
  end

  def buy_drink(drink)
    @wallet -= drink.price
  end

  def can_afford(stuff)
    if @wallet < stuff.price
      return "You can't afford that"
    else
      return stuff
    end
  end

end
