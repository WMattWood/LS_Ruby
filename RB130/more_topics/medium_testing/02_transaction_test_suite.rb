require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def setup
    @register = CashRegister.new(100)
  end

  def test_prompt_for_payment
    transaction = Transaction.new(25) 
    input = StringIO.new("30\n")
    transaction.prompt_for_payment(input: input)
    assert_equal 30, transaction.amount_paid
  end
end