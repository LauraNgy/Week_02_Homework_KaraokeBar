class Room

  attr_reader :name, :song_list, :guest_list, :capacity, :max_capacity

  def initialize(name, guest_list, song_list, max_capacity)
    @name = name
    @song_list = song_list
    @guest_list = guest_list
    @capacity = 10
    @max_capacity = max_capacity
  end


end
