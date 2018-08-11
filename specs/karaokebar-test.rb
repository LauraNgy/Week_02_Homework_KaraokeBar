require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")
require_relative("../drink")
require_relative("../room")
require_relative("../karaokebar")

class KaraokeBarTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Mojito", 3)
    @drink2 = Drink.new("Pina Colada", 2)
    @drink3 = Drink.new("Old Fashioned", 4)
    @drinks = [@drink1, @drink2, @drink3]
    @guest1 = Guest.new("Simon", 100, "Sleeping Sun")
    @guest2 = Guest.new("Amy", 200, "Amaranth")
    @guest3 = Guest.new("Mindy", 100, "My Favourite Things")
    @guest4 = Guest.new("Gabi", 200, "Twist And Shout")
    @guest_list1 = [@guest1, @guest2]
    @guest_list2 = [@guest3, @guest4]
    @song1 = Song.new("Sleeping Sun", "pip pip")
    @song2 = Song.new("21 Guns", "tu tu")
    @song3 = Song.new("Twist And Shout", "piri tu")
    @song4 = Song.new("Broad Way Blues", "tu turu")
    @song_list1 = [@song1, @song2]
    @song_list2 = [@song3, @song4]
    @song_list3 = [@song1, @song4]
    @room1 = Room.new("Metal", @song_list1, 2)
    @room2 = Room.new("Jazz", @song_list2, 3)
    @room3 = Room.new("Mixed", @song_list3, 3)
    @rooms = [@room1, @room2, @room3]
    @guest_list1.each { |guest| @room1.guest_list.push(guest)}
    @room2.book(@guest4)
    @guest1.update_guest_tab(@song2)
    @guest1.update_guest_tab(@drink1)
    @karaokebar = KaraokeBar.new(100, @rooms, @drinks)
  end

  def test_has_starting_till
    assert_equal(100, @karaokebar.starting_till)
  end

  def test_has_ending_till
    assert_equal(100, @karaokebar.ending_till)
  end

  def test_has_rooms
    assert_equal(@rooms, @karaokebar.rooms)
  end

  def test_has_drinks
    assert_equal(@drinks, @karaokebar.drinks)
  end

  def test_retrieve_guest
    assert_equal(@room1, @karaokebar.retrieve_guest(@guest1))
  end

  def test_square_up
    @karaokebar.square_up(@guest1)
    assert_equal([], @guest1.guest_tab)
    assert_equal(104, @karaokebar.ending_till)
    assert_equal([@drink2, @drink3], @karaokebar.drinks)
  end

  def test_check_stock
    @karaokebar.square_up(@guest1)
    assert_equal([@drink2, @drink3], @karaokebar.check_stock)
  end

  def test_check_profits
    @karaokebar.square_up(@guest1)
    assert_equal(4, @karaokebar.check_profits)
  end

end
