require("minitest/autorun")
require("minitest/rg")
require_relative("../models/animal.rb")

class TestAnimal < MiniTest::Test

  def setup()
      options = {"id" => 1, "animal_name" => "Max", "species" => "dog",
        "age" => 8, "training" => "No","Adoptable" => "Yes", "admission_date" => "22/10/2018"}

      @animal = Animal.new(options)
  end

  def test_animal_name()
  result = @animal.animal_name()
  assert_equal("Max", result)
  end

  def test_animal_training()
    result = @animal.training()
    assert_equal("No", result)
  end

  def test_animal_admission
    result = @animal.admission_date()
    assert_equal("22/10/2018", result)
  end


end
