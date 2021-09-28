class CreateOverlinks < ActiveRecord::Migration[6.1]
  def change
    create_table :overlinks do |t|
      t.string :url
      t.string :title
      t.text :description
      t.references :trail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
