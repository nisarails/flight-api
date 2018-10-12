class FlightInformation < ApplicationRecord
  def self.search(params)
    filter_params = {}
    filter_params[:flight_type] = params[:flight_type] || 'departures'

    where(filter_params).order("time asc")
  end
end
