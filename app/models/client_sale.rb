class ClientSale < ApplicationRecord
  has_one :client, dependent: :destroy
end
