class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :listing, foreign_key: true, index: true
      t.date :check_in
      t.date :check_out
      t.timestamps
    end
  end
end
