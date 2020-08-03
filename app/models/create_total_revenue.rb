class CreateTotalRevenue < ApplicationRecord
  has_one :client, dependent: :destroy
end
