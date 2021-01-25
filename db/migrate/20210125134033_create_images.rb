class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :blog, foreign_key:true
      t.string :src, null:false
      t.timestamps
    end
  end
end
