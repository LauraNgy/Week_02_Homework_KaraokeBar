class KaraokeBar
  attr_reader :starting_till, :ending_till, :rooms, :drinks

  def initialize(starting_till, rooms, drinks)
    @starting_till = starting_till
    @ending_till = starting_till
    @rooms = rooms
    @drinks = drinks
  end

  def retrieve_guest(guest)
    @rooms.each { |room| return room if room.is_there(guest)}
  end

  def square_up(guest)
    room_with_guest = retrieve_guest(guest)
    room_with_guest.guest_list.each { |guest_in_room|
    if guest_in_room == guest
      guest_tab = guest.guest_tab
      total = guest_tab.reduce(0) { |total, stuff|
        total += stuff.price}
      @ending_till += total
      guest_tab.each { |stuff|
        @drinks.each { |drink|
          if drink == stuff
            guest_tab.delete(drink)
            @drinks.delete(drink)
          end}}
      guest.pay_tab
    end
      }
  end

  def check_stock
    return @drinks
  end

  def check_profits
    return @ending_till - @starting_till
  end

end
