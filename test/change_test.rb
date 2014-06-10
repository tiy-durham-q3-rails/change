require "minitest/autorun"
require "change"

# test = ChangeTest.new
# test.setup
# test.test_change_can_be_created
# test.setup
# test.test_change_stores_its_argument

class ChangeTest < MiniTest::Unit::TestCase
  def setup
    @change = Change.new(0.51)
  end

  def test_change_can_be_created
    assert !@change.nil?, "Change is nil!"
  end

  def test_change_stores_its_argument
    assert_equal 0.51, @change.money
  end

  def test_we_can_get_change
    5.times do |i|
      assert_equal({:quarters => 0, :dimes => 0, :pennies => i, :nickels => 0}, Change.new(i / 100.0).make_change)
    end
  end

  def test_that_nickels_work
    assert_equal({:quarters => 0, :dimes => 0, :nickels => 1, :pennies => 0}, Change.new(0.05).make_change)
    assert_equal({:quarters => 0, :dimes => 0, :nickels => 1, :pennies => 1}, Change.new(0.06).make_change)
  end

  def test_that_dimes_work
    assert_equal({:quarters => 0, :dimes => 1, :nickels => 0, :pennies => 4}, Change.new(0.14).make_change)
  end

  def test_that_quarters_work
    assert_equal({:quarters => 2, :dimes => 0, :nickels => 0, :pennies => 1}, Change.new(0.51).make_change)
    assert_equal({:quarters => 2, :dimes => 1, :nickels => 1, :pennies => 1}, Change.new(0.66).make_change)
    assert_equal({:quarters => 3, :dimes => 0, :nickels => 1, :pennies => 1}, Change.new(0.81).make_change)
  end
end
