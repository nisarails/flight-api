class Api::FlightInformationsController < ApplicationController
  def index
    flights = FlightInformation.search(params)
    render json: flights
  end
end
