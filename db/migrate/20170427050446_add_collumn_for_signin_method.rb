class AddCollumnForSigninMethod < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :signin_method, :string
  end
end
