class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_comment
      t.references :user, foreign_key: { to_table: :users}
      t.references :book, foreign_key: { to_table: :books}

      t.timestamps
    end
  end
end
