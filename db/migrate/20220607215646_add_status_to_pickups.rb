class AddStatusToPickups < ActiveRecord::Migration[6.1]
  def change
    add_column :pickups, :status, :integer, default: 0, null: false
  end
end
