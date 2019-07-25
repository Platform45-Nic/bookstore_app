class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.string :name, unique: true, null: false, default: ""
      t.references :created_by, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
