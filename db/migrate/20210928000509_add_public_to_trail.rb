class AddPublicToTrail < ActiveRecord::Migration[6.1]
  def change
    add_column :trails, :public, :boolean, default: false
  end
end
