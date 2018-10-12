class CreateFlightInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_informations do |t|
      t.string :flight_type
      t.datetime :time
      t.datetime :expected_time
      t.text :destination
      t.string :city
      t.string :airport_no
      t.string :airline
      t.string :gate
      t.string :terminal
      t.string :status

      t.timestamps
    end
  end
end
