class AddExchangesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :exchanges, :integer
  end
end
