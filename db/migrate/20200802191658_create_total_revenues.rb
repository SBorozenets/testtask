class CreateTotalRevenues < ActiveRecord::Migration[6.0]
  def change
    create_table :create_total_revenues do |t|
      t.bigint :client_id, null: false
      t.bigint :total_revenue
      t.timestamps

      t.index :client_id, unique: true
    end
  end
end
