require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def setup
    @register = CashRegister.new(100)
    @unsuccessful_transaction = Transaction.new(25)
    @unsuccessful_transaction.amount_paid = 15    
  end

  def test_accept_money
    @successful_transaction = Transaction.new(20)
    @successful_transaction.amount_paid = 20

    amount_paid = @successful_transaction.amount_paid
    our_cash = @register.total_money
    assert_equal(our_cash += amount_paid, @register.accept_money(@successful_transaction))
  end

  def test_change
    @change_transaction = Transaction.new(20)
    @change_transaction.amount_paid = 30

    assert_equal(10, @register.change(@change_transaction))
  end

  def test_receipt
    @successful_transaction = Transaction.new(20)

    out, _ = capture_io do 
      @register.give_receipt(@successful_transaction)
    end
    
    assert_equal("You've paid $20.\n", out)
  end
end