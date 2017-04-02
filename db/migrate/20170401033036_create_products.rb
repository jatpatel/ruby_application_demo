class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    enable_extension("citext")

    create_table :products do |t|
      t.citext :code, null: false
      t.citext :name, null: false
      t.integer :category_id, unsigned: true
      t.decimal :price
      t.timestamps default: Time.now
      t.references :categories, foreign_key: {on_delete: :cascade}
      t.index :name, unique: true
    end

  end
end