require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name:"programming")
    end
    
    test "Category should be valid" do
        assert @category.valid?
    end

    test "name should be present" do
        @category.name  = " "
        assert_not @category.valid?
    end

    test "name should be unique" do
        @category.save
        @category2 = Category.new(name: "programming")
        assert_not @category2.valid?
    end
end