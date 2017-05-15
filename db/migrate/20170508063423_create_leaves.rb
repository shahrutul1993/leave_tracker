class CreateLeaves < ActiveRecord::Migration[5.1]
  def change
    create_table :leaves do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :no_of_days
      t.string :reason

      t.timestamps
    end
  end
end
