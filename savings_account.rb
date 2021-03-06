require_relative 'account.rb'
require 'csv'

MINIMUM_BALANCE = 10.00
WITHDRAW_FEE = 2.00

module Bank
  class SavingsAccount < Account
    attr_accessor :balance, :interest

    def initialize()
      super
      @balance = balance
      @interest = interest
    end

    def create_account(balance)
      @balance = balance.to_f/100
      while @balance < MINIMUM_BALANCE
        negative_initial
      end
      return @balance
    end

    def withdraw(dollar_amount)
      if (@balance - dollar_amount - WITHDRAW_FEE) < MINIMUM_BALANCE
        puts "I'm sorry, you cannot withdraw that amount, as you do not have enough money in your account."
      else
        @balance -= (dollar_amount + WITHDRAW_FEE)
      end
      return @balance
    end

    # Input rate is assumed to be a percentage (i.e. 0.25).
    # The formula for calculating interest is balance * rate/100
    def add_interest(rate)
      @interest = @balance * (rate/100)
      return @interest
    end
  end
end

save = Bank::SavingsAccount.new
save.create_account(1098)
puts save.balance
save.withdraw(10)
puts save.balance
save.add_interest(0.50)
puts save.interest
