namespace :import_flight_info do
  desc "Import all departures flight info "
  task departures: :environment do
    Anemone.crawl("https://www.cph.dk/en/flight-information/departures") do |anemone|
      mapping_data('departures', anemone)
    end
  end

  desc "Import all arrivals flight info "
  task arrivals: :environment do
    Anemone.crawl("https://www.cph.dk/en/flight-information/arrivals") do |anemone|
      mapping_data('arrivals', anemone)
    end
  end

  def mapping_data(type, anemone)
    anemone.on_every_page do |page|
      html_doc = Nokogiri::HTML(page.body)
      html_doc.css(".stylish-table__row--body").each do |row|
        flight_information = FlightInformation.new
        flight_information.airline = row.css(".v--desktop-only")[1].try(:text).try(:strip)
        flight_information.time = row.css(".flights__table__col--time").text.try(:strip).split("\n")[0].try(:strip)
        flight_information.expected_time = row.css(".flights__table__col--time").text.try(:strip).split("\n")[1].try(:strip)
        destination = row.css(".flights__table__col--destination").text.try(:strip).split("\n")
        flight_information.flight_type = type
        flight_information.destination = destination[0].try(:strip)
        flight_information.city = destination[1].try(:strip)
        flight_information.airport_no = destination[2].try(:strip)
        flight_information.gate = row.css(".flights__table__col--gate").text.try(:strip)
        flight_information.status = row.css(".stylish-table__cell")[-2].try(:text).try(:strip)

        flight_information.save
      end
      abort
    end
  end
end
