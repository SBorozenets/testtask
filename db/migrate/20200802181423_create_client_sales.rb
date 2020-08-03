class CreateClientSales < ActiveRecord::Migration[6.0]
  def change
    create_table :client_sales do |t|
      t.bigint :client_id, null: false
      t.bigint :revenue
      t.timestamps

      t.index :client_id, unique: true
    end
  end
end
