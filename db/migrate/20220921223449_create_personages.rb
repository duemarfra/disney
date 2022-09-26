class CreatePersonages < ActiveRecord::Migration[6.1]
  def change
    create_table :personages do |t|
      t.string :name
      t.integer :age
      t.float :weight
      t.text :history
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
