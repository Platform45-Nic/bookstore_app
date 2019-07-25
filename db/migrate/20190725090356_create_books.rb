class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, foreign_key: { to_table: :users}
      t.references :genre, foreign_key: { to_table: :genres}
      t.text :description
      t.date :published_date

      t.timestamps
    end
  end
end
