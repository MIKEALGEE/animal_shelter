require("minitest/autorun")
require("minitest/rg")
require_relative("../models/customer.rb")
require("pry")

class TestCustomer < MiniTest::Test

  def setup()
    options = {"id" => 1, "first_name" => "Mike", "last_name" => "Griffin", "appointment" => "10/22/2017"}
    @customer = Customer.new(options)
  end


  def test_customer_name()
    result = @customer.first_name
    assert_equal("Mike",result)
  end

  def test_customer_appointment
    result = @customer.appointment
    assert_equal("10/22/2017", result)
  end



end
