class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.references :Agent
      t.integer :order
      t.string :address

      t.timestamps
    end
  end
end
