class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :description
      t.references :client
      t.references :agent
      t.references :route
      t.datetime :start_at
      t.datetime :finish_at


      t.timestamps
    end
  end
end
