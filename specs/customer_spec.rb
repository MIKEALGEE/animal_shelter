require("minitest/autorun")
require("minitest/rg")
require_relative("../models/customer.rb")
require("pry")

class TestCustomer < MiniTest::Test

def setup()
  options = {"id" => 1, "first_name" => "Mike", "last_name" => "Griffin"}
  @customer = Customer.new(options)
end


def test_customer_name()
  result = @customer.first_name
  assert_equal("Mike",result)
end





end
