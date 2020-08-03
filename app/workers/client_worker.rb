class ClientWorker
  include Sidekiq::Worker
  require 'json'
  require 'open-uri'

  def perform()
    data_hash = JSON.parse open('https://dashboard-qa.ikizmet.com/api/v2/tests/client_info.json').read
    data_hash['data'].each do |d|
      Client.upsert(id: d['client_id'], first_name: d['client_first_name'], last_name: d['client_last_name'], created_at: Time.now, updated_at: Time.now)
    end
  end
end
