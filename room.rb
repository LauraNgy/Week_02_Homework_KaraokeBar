class Room

  attr_reader :name, :song_list, :guest_list, :capacity, :booked

  def initialize(name, song_list, capacity)
    @name = name
    @song_list = song_list
    @capacity = capacity
    @guest_list = []
    @booked = nil
  end

  def in_capacity
    if @guest_list.length > @capacity
      return false
    else
      return true
    end
  end

  def check_in(guest)
    @guest_list.push(guest)
    if !in_capacity
      @guest_list.delete(guest)
    end
  end

  def check_out(guest)
    @guest_list.delete(guest)
  end

  def add_song(song)
    @song_list.push(song)
  end

  def remove_song(song)
    @song_list.delete(song)
  end

  def show_songs
    song_names = []
    @song_list.each { |song| song_names.push(song.name)}
    return song_names
  end

  def play_song(guest, song)
    if guest.can_afford(song)
      return song.tune
    else
      return "You can't afford that"
    end
  end

  def book(guest)
    @booked = "Room booked by #{guest}"
    return @booked
  end

  def status
    if @guest_list.length != 0
      return "in use"
    elsif @booked != nil
      return "booked"
    else
      return "free"
    end
  end

end
