class RemoveEndDateToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :end_date
  end
end
