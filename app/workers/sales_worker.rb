class SalesWorker
  include Sidekiq::Worker
  require 'json'
  require 'open-uri'

  def perform()
    data_hash = JSON.parse open('https://dashboard-qa.ikizmet.com/api/v2/tests/client_sales.json').read
    data_hash['data'].each do |d|
      ClientSale.upsert({ client_id: d['client_id'], revenue: d['revenue'], created_at: Time.now, updated_at: Time.now }, unique_by: :client_id)
    end
    TotalRevenueWorker.perform_async(data_hash['data'])
    p 'Buy!'
  end
end
