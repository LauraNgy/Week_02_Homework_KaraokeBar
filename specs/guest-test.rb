require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")
require_relative("../drink")

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Simon", 100, "Sleeping Sun")
    @song1 = Song.new("Sleeping Sun", "pip pip")
    @song2 = Song.new("21 Guns", "tu tu")
    @song2.ammend_price(2)
    @song_arr = [@song1, @song2]
    @drink1 = Drink.new("Mojito", 3)
    @drink2 = Drink.new("Cosmopolitan", 51)
    @drinks_arr = [@drink1, @drink2]
  end

  def test_guest_has_name
    assert_equal("Simon", @guest.name)
  end

  def test_guest_has_favourite_song
    assert_equal("Sleeping Sun", @guest.favourite_song)
  end

  def test_guest_has_wallet
    assert_equal(100, @guest.wallet)
  end

  def test_favourite_song_exists
    assert_equal("Whoop", @guest.check_favourite_song("Sleeping Sun", @song_arr))
    assert_equal("Awww", @guest.check_favourite_song("Hold On", @song_arr))
  end

  def test_pay_song_fee
    @guest.pay_song_fee(@song2)
    assert_equal(98, @guest.wallet)
  end

  def test_can_afford
    @guest.buy_drink(@drink2)
    assert_equal("You can't afford that", @guest.can_afford(@drink2))
    assert_equal(@drink1, @guest.can_afford(@drink1))
  end

  def test_buy_drink
    @guest.buy_drink(@drink1)
    assert_equal(97, @guest.wallet)
  end

end
