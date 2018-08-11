class Guest

  attr_reader :name, :wallet, :favourite_song, :guest_tab

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
    @guest_tab = []
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

  def update_guest_tab(stuff)
    if can_afford(stuff)
      @guest_tab.push(stuff)
    end
  end

  def pay_tab
    if @guest_tab.length != 0
      @guest_tab.each { |stuff|
      @wallet -= stuff.price}
    end
  end


end
