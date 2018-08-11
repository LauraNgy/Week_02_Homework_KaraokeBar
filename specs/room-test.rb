require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")
require_relative("../drink")
require_relative("../room")

class RoomTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Simon", 100, "Sleeping Sun")
    @guest2 = Guest.new("Amy", 200, "Amaranth")
    @guest3 = Guest.new("Mindy", 100, "The Gift")
    @guest_list = [@guest1, @guest2]
    @song1 = Song.new("Sleeping Sun", "pip pip")
    @song2 = Song.new("21 Guns", "tu tu")
    @song2.ammend_price(101)
    @song3 = Song.new("The Gift", "pa pap")
    @song_list = [@song1, @song2]
    @room = Room.new("Metal", @guest_list, @song_list, 15)
  end

  def test_room_has_name
    assert_equal("Metal", @room.name)
  end

  def test_room_has_guest_list
    assert_equal([@guest1, @guest2], @room.guest_list)
  end

  def test_room_has_song_list
    assert_equal([@song1, @song2], @room.song_list)
  end

  def test_room_has_capacity
    assert_equal(10, @room.capacity)
  end

  def test_room_has_max_capacity
    assert_equal(15, @room.max_capacity)
  end

  def test_check_in_guest
    @room.check_in(@guest3)
    assert_equal([@guest1, @guest2, @guest3], @room.guest_list)
  end

  def test_check_out_guest
    @room.check_out(@guest2)
    assert_equal([@guest1], @room.guest_list)
  end

  def test_add_song_to_list
    @room.add_song(@song3)
    assert_equal([@song1, @song2, @song3], @room.song_list)
  end

  def test_remove_song_from_list
    @room.remove_song(@song2)
    assert_equal([@song1], @room.song_list)
  end

  def test_show_song_list
    assert_equal(["Sleeping Sun", "21 Guns"], @room.show_songs())
  end

  def test_play_song
    assert_equal("You can't afford that", @room.play_song(@guest1, @song2))
    assert_equal("pip pip", @room.play_song(@guest1, @song1))
  end 
end
