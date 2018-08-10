require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")
require_relative("../drink")
require_relative("../room")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Simon", 100, "Sleeping Sun")
    @guest2 = Guest.new("Amy", 200, "Amaranth")
    @guest_list = [@guest1, @guest2]
    @song1 = Song.new("Sleeping Sun", "pip pip")
    @song2 = Song.new("21 Guns", "tu tu")
    @song2.price = 101
    @song_list = [@song1, @song2]
    @room = Room.new(@guest_list, @song_list, 15)
  end

end
