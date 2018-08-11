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
    @song1 = Song.new("Sleeping Sun", "pip pip")
    @song2 = Song.new("21 Guns", "tu tu")
    @song2.ammend_price(101)
    @song3 = Song.new("The Gift", "pa pap")
    @song_list = [@song1, @song2]
    @room = Room.new("Metal", @song_list, 2)
  end

  def test_room_has_name
    assert_equal("Metal", @room.name)
  end

  def test_room_has_guest_list
    @room.check_in(@guest1)
    @room.check_in(@guest2)
    assert_equal([@guest1, @guest2], @room.guest_list)
  end

  def test_room_has_song_list
    assert_equal([@song1, @song2], @room.song_list)
  end

  def test_room_has_capacity
    assert_equal(2, @room.capacity)
  end

  def test_room_not_booked
    assert_nil(@room.booked)
  end

  def test_check_out_guest
    @room.check_in(@guest1)
    @room.check_in(@guest2)
    @room.check_out(@guest2)
    assert_equal([@guest1], @room.guest_list)
  end

  def test_check_in_guest
    @room.check_in(@guest3)
    assert_equal([@guest3], @room.guest_list)
  end

  def test_guest_is_there__true
    @room.check_in(@guest1)
    assert_equal(true, @room.is_there(@guest1))
  end

  def test_guest_is_there__false
    @room.check_in(@guest1)
    assert_equal(false, @room.is_there(@guest2))
  end

  def test_guest_already_there
    @room.check_in(@guest2)
    assert_equal("#{@guest2} is there", @room.check_in(@guest2))
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

  def test_play_song__cant_afford
    @room.check_in(@guest1)
    assert_equal("You can't afford that", @room.play_song(@guest1, @song2))
  end

  def test_play_song__can_afford
    @room.check_in(@guest1)
    assert_equal("pip pip", @room.play_song(@guest1, @song1))
  end

  def test_room_in_capacity__true
    assert_equal(true, @room.in_capacity)
  end

  def test_room_in_capacity__false
    @room.check_in(@guest1)
    @room.check_in(@guest2)
    @room.guest_list.push(@guest3)
    assert_equal(false, @room.in_capacity)
  end

  def test_book_room__booked
    assert_equal("Room booked by #{@guest3}", @room.book(@guest3))
  end

  def test_room_status__free
    assert_equal("free", @room.status)
  end

  def test_room_status__in_use
    @room.check_in(@guest2)
    assert_equal("in use", @room.status)
  end

  def test_room_status__booked
    @room.book(@guest1)
    assert_equal("booked", @room.status)
  end

end
