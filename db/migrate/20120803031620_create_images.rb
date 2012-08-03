class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :caption
      t.string :model_type
      t.integer :model_id

      t.timestamps
    end
  end
end
