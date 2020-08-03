class Client < ApplicationRecord
  belongs_to :client_sale
  belongs_to :create_total_revenue
end
