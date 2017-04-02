class Product < ActiveRecord::Base
  require 'CSV'

  belongs_to :category

  validates :name, :code, :price, :category_id, presence: true
  validates :name, :code, uniqueness: true

  def self.import(file)

    Product.transaction do
      CSV.foreach(file.path, headers: true) do |row|

        data = row.to_hash

        raise "Invalid data" if data["ProductID"].nil?

        # here.. idea was to create product_code from category code + index of product
        # though, as we supply a ProductID from csv we don't need this one.
        category_code = data["ProductID"].gsub(/[^a-z]/i, '')

        product = Product.find_by code: data["ProductID"]
        category = Category.find_or_create_by(name: data["Category"], code: category_code)


        product_data = {
            code: data["ProductID"],
            name: data["Product Name"],
            price: data["Price"],
            category_id: category.id
        }

        if product.present?
          product.assign_attributes(product_data)
        else
          product = Product.new(product_data)
        end

        raise ValidationError, product.errors unless product.valid?

        product.save
      end
    end
  end

  def self.export
    CSV.generate(headers: true) do |csv|
      csv << ["ProductID", "Category", "Product Name", "Price"]

      Product.joins(:category)
          .select('products.code, categories.name as category_name, products.name, price')
          .each do |record|
            csv << [record.code, record.category_name, record.name, record.price]
          end
    end
  end
end
