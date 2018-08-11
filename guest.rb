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

  def can_afford(stuff)
    if @wallet < stuff.price
      return false
    else
      return true
    end
  end

  def pay_song_fee(song)
    if can_afford(song)
      @wallet -= song.price
    end
  end

  def buy_drink(drink)
    if can_afford(drink)
      @wallet -= drink.price
    end
  end


end
