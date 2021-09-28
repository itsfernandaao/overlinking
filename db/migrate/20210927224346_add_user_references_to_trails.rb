class AddUserReferencesToTrails < ActiveRecord::Migration[6.1]
  def change
    add_reference :trails, :user, null: false, foreign_key: true
  end
end
