require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  setup do
    @region = Region.create({ name: 'EMEA' })
    @department = @region.departments.build({ name: 'sales'})
  end

  test "should be valid" do
    assert @department.valid?
  end

  test "should have name" do
    @department.name = ''
    assert_not @department.valid?
  end
end
