class Room

  attr_reader :name, :song_list, :guest_list, :capacity, :max_capacity

  def initialize(name, guest_list, song_list, max_capacity)
    @name = name
    @song_list = song_list
    @guest_list = guest_list
    @capacity = 10
    @max_capacity = max_capacity
  end

  def check_in(guest)
    @guest_list.push(guest)
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

end
