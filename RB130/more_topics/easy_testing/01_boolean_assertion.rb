require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class ExerciseTest < MiniTest::Test

  def test_value
    value = 1
    assert(value.odd?)
  end

  def test_downcase
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
  
  def test_nil
    value = nil
    assert_nil(value)
    # assert_equal(nil, value)
  end

  def test_empty
    list = []
    assert_empty list
    # assert list.empty?
    # assert_equal true, list.empty?
  end

  def test_xyz
    list = ['xyz']
    assert_includes list, 'xyz'
  end

  # def test_hire # tests for what error is raised
  #   assrt_raises NoExperienceError do
  #     employee.hire
  #   end
  # end

  def test_instance_of # tests whether second argument is of the named class
    value = Numeric.new
    assert_instance_of Numeric, value
  end

  def test_kind_of # tests whether second argument is child of the named class
    value = 1
    assert_kind_of Numeric, value
  end

  # def test_same # tests whether first and second arguments are the same object
  #   assert_same list, list.process
  # end

  def test_not_xyz
    list = ['abc']
    refute_includes list, 'xyz'
  end

end