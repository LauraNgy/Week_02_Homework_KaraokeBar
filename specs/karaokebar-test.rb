require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")
require_relative("../drink")
require_relative("../room")
require_relative("../karaokebar")

class KaraokeBarTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Simon", 100, "Sleeping Sun")
    @guest2 = Guest.new("Amy", 200, "Amaranth")
    @guest3 = Guest.new("Mindy", 100, "My Favourite Things")
    @guest4 = Guest.new("Gabi", 200, "Watermelon Man")
    @guest_list1 = [@guest1, @guest2]
    @guest_list2 = [@guest3, @guest4]
    @song1 = Song.new("Sleeping Sun", "pip pip")
    @song2 = Song.new("21 Guns", "tu tu")
    @song3 = Song.new("Watermelon Man", "piri tu")
    @song4 = Song.new("Broad Way Blues", "tu turu")
    @song_list1 = [@song1, @song2]
    @song_list2 = [@song3, @song4]
    @room1 = Room.new("Metal", @guest_list, @song_list, 2)

  end
