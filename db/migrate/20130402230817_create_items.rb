class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :property_valuations
      t.string :barcode

      t.timestamps
    end
  end
end
