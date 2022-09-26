class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :creation_date
      t.integer :score
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
