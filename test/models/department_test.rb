require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  setup do
    @department = Department.new({ name: 'sales'})
  end

  test "should be valid" do
    assert @department.valid?
  end

  test "should have name" do
    @department.name = ''
    assert_not @department.valid?
  end

  test "name should be unique" do
    department1 = Department.create({ name: 'test' })
    department2 = Department.new({ name: 'test'})
    assert_not department2.save
  end
end
