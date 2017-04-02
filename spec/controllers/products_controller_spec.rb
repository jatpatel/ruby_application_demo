require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it "assigns @products" do
      product = FactoryGirl.create(:product)
      get :index
      expect(response).to render_template("product/index")
    end
  end

  describe "POST #import" do
    subject(:products_file) do
      product1 = FactoryGirl.build(:product)
      product2 = FactoryGirl.build(:product)

      CSV.generate do |csv|
        csv << ["ProductID", "Category", "Product Name", "Price"]
        csv << [product1.code, "category1", product1.name, product1.price]
        csv << [product2.code, "category1", product2.name, product2.price]
      end
    end

    context "import file" do
      it "imports csv file" do
        # TODO: needs to be done.
      end
    end
  end

  describe "GET products#show" do
    it "show @product" do
      get :show, params: { id: FactoryGirl.create(:product).id }

      expect(response).to render_template("product/details")
    end
  end

end
