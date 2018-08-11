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
    @karaokebar = KaraokeBar.new(100, @rooms, @drinks)
  end



end
