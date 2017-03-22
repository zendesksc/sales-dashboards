require 'test_helper'

class DashboardTest < ActiveSupport::TestCase

    setup do
      @dashboard = Dashboard.new({ name: "Sales Quarterly Dashboard", url: "https://bime.io/sales/wallboard"})
    end

    test "should be valid" do
      assert @dashboard.valid?
    end

    test "should have a name" do
      @dashboard.name = ""
      assert_not @dashboard.valid?
    end

    test "name should be unique" do
      dashboard1 = Dashboard.create({ name: 'test', url: 'https://test.com'})
      dashboard2 = Dashboard.new({ name: 'test', url: 'https://anothertest.com'})
      assert_not dashboard2.save
    end

    test "should have a url" do
      @dashboard.url = ""
      assert_not @dashboard.valid?
    end

    test "url should be valid https" do
      @dashboard.url = "this is not a url"
      assert_not @dashboard.valid?

      @dashboard.url = "http://thisisntavalidurl.com"
      assert_not @dashboard.valid?
    end

    test "url should be unique" do
      dashboard1 = Dashboard.create({ name: 'test', url: 'https://test.com'})
      dashboard2 = Dashboard.new({ name: 'another name', url: 'https://test.com'})
      assert_not dashboard2.save
    end

end