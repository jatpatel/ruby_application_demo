class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    enable_extension("citext")

    create_table :categories do |t|
      t.citext :code, null: false
      t.citext :name, null: false
      t.timestamps default: Time.now
      t.index :name, unique: true
    end
  end
end
