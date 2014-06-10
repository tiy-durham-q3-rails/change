class Change
  def initialize(money)
    @cents = (money * 100).to_i
  end

  def money
    @cents / 100.0
  end

  def make_change
    cents = @cents
    quarters = cents / 25
    cents -= (quarters * 25)
    dimes = cents / 10
    cents -= (dimes * 10)
    nickels = cents / 5
    cents -= (nickels * 5)
    pennies = cents
    { :quarters => quarters,
      :dimes => dimes,
      :nickels => nickels,
      :pennies => pennies }
  end

  module Command
    def self.run
      print "How much change do you need? "
      amount_of_money = gets.to_f
      change = Change.new(amount_of_money)
      puts change.make_change
    end
  end
end
