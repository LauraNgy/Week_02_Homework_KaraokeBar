require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class SongTest < MiniTest::Test

  def setup
    @song = Song.new("Sleeping Sun", "pip pip")
  end

  def test_song_has_name
    assert_equal("Sleeping Sun", @song.name)
  end

  def test_song_has_tune
    assert_equal("pip pip", @song.tune)
  end

  def test_song_has_price
    assert_equal(1, @song.price)
  end

end
