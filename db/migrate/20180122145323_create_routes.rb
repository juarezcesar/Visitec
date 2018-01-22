class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.references :Agent
      t.order :integer
      t.string :Address

      t.timestamps
    end
  end
end
