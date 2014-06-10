class Change
  def initialize(money)
    @cents = (money * 100).to_i
  end

  def money
    @cents / 100.0
  end

  def make_change
    { :quarters => @cents / 25,
      :dimes => (@cents % 25) / 10,
      :nickels => (@cents % 10) / 5,
      :pennies => @cents % 5 }
  end
end
