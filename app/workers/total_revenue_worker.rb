class TotalRevenueWorker
  include Sidekiq::Worker

  def perform(data)
    data.each do |d|
      CreateTotalRevenue.upsert({ client_id: d['client_id'], total_revenue: total_revenue(d), created_at: Time.now, updated_at: Time.now }, unique_by: :client_id)
    end

    max_client = find_client(max_revenue.client_id)
    min_client = find_client(min_revenue.client_id)
    current_min_client = find_client(current_min_revenue(data).client_id)
    Summary.delete_all
    Summary.create(first_name: max_client.first_name, last_name: max_client.last_name, max_revenue: max_revenue.total_revenue)
    Summary.create(first_name: min_client.first_name, last_name: min_client.last_name, min_revenue: min_revenue.total_revenue)
    Summary.create(first_name: current_min_client.first_name, last_name: current_min_client.last_name, current_min_revenue: current_min_revenue(data).revenue)
    Summary.create(sum_revenue: sum_revenue)
    top_revenue.each do |rev|
      user = find_client(rev.client_id)
      Summary.create(first_name: user.first_name, last_name: user.last_name, revenue: rev.total_revenue)
    end
  end

  def total_revenue(d)
    CreateTotalRevenue.find_by(client_id: d['client_id']).total_revenue + d['revenue']
  end

  def max_revenue
    @max_revenue ||= CreateTotalRevenue.find_by(total_revenue: CreateTotalRevenue.pluck('total_revenue').max)
  end

  def min_revenue
    @min_revenue ||= CreateTotalRevenue.find_by(total_revenue: CreateTotalRevenue.pluck('total_revenue').min)
  end

  def current_min_revenue(data)
    @current_min_revenue ||= ClientSale.find_by(revenue: data.pluck('revenue').min)
  end

  def top_revenue
    CreateTotalRevenue.all.order(total_revenue: :desc).first(15)
  end

  def sum_revenue
    @sum_revenue ||= ClientSale.pluck('revenue').sum
  end

  def find_client(id)
    Client.find_by(id: id)
  end
end