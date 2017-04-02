require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET index" do
    it "assigns @categories" do
      category = FactoryGirl.create(:category)
      get :index
      expect(response).to render_template("category/index")
    end
  end
end
