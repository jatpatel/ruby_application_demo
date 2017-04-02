require 'rails_helper'


RSpec.feature "Products", type: :feature do
  feature "Uploading a CSV file" do

    background do

      category = FactoryGirl.create(:category,
                                    :code => "C",
                                    :name => "Category1"
                                    )
      @product = FactoryGirl.create(:product,
                                 :code => "C1",
                                 :name => "Product1",
                                 :price => 100,
                                 :category => category)
    end

    scenario "create or update products" do
      require 'csv'
      # TODO: required to implement import csv test
    end
  end
end
