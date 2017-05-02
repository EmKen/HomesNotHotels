class ChangeStatusToRole < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :status, :role
  end
end
