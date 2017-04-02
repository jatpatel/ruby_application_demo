class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name).all.map do |record|
      {
          id: record.id,
          name: record.name
      }
    end

    render template: "category/index"
  end
end
