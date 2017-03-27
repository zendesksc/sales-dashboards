require 'test_helper'

class RegionTest < ActiveSupport::TestCase
  setup do
    @region = Region.new({ name: 'EMEA' })
  end

  test "should be valid" do
    assert @region.valid?
  end

  test "should have name" do
    @region.name = ''
    assert_not @region.valid?
  end

  test "name should be unique" do
    region1 = Region.create({ name: 'test' })
    region2 = Region.new({ name: 'test' })
    assert_not region2.save
  end
end
