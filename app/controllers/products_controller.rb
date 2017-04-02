class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    page = params[:page] || 1

    query = Product.joins(:category)
                .order('products.name')
                .select('products.id as product_id,
                         products.code, products.name, categories.name as category_name, price')

    query = query.where(category_id: params[:category_id].to_i) if params[:category_id].present?

    @products = query.paginate(per_page: 5, page: page).all

    render template: "product/index"
  end

  def import
    begin
      Product.import(params[:file])
      redirect_to action: "index", notice: "Products imported."
    rescue
      redirect_to action: "index", notice: "Invalid CSV file format."
    end
  end

  def export
    send_data Product.export,
              :type => 'text/csv; charset=iso-8859-1; header=present',
              :disposition => "attachment; filename=products.csv"
  end

  def show
    render template: "product/details"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
