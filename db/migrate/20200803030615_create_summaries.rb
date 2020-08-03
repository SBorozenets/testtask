class CreateSummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :summaries do |t|
      t.string :first_name
      t.string :last_name
      t.bigint :max_revenue
      t.bigint :min_revenue
      t.bigint :current_min_revenue
      t.bigint :sum_revenue
      t.bigint :revenue
      t.timestamps
    end
  end
end
