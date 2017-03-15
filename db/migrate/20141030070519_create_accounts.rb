class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.datetime :date
      t.float :amount
      t.string :remarks

      t.timestamps
    end
  end
end
