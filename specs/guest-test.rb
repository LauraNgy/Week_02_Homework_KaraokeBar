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
    @drink2 = Drink.new("Cosmopolitan", 101)
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

  def test_guest_tab__initialized
    assert_equal([], @guest.guest_tab)
  end

  def test_guest_tab__updated
    @guest.update_guest_tab(@song2)
    @guest.update_guest_tab(@drink1)
    assert_equal([@song2, @drink1], @guest.guest_tab)
  end

  def test_pay_guest_tab
    @guest.update_guest_tab(@song2)
    @guest.update_guest_tab(@drink1)
    @guest.pay_tab
    assert_equal(95, @guest.wallet)
  end

  def test_can_afford
    assert_equal(false, @guest.can_afford(@drink2))
    assert_equal(true, @guest.can_afford(@drink1))
  end

end
