require 'net/http'
namespace :load_data do
  desc "TODO"
  task nasa_data: :environment do
    url = URI.parse('https://data.nasa.gov/resource/tfkf-kniw.json')
    req = Net::HTTP.get(url)
    data = JSON.parse(req)
    data.each do |landslide|
      new_data = Landslide.new(
        user: User.first,
        hazard_type: landslide["hazard_type"],
        countrycode: landslide["countrycode"],
        countryname: landslide["countryname"],
        fatalities: landslide["fatalities"],
        injuries: landslide["injuries"],
        landslide_size: landslide["landslide_size"],
        landslide_type: landslide["landslide_type"],
        latitude: landslide["latitude"],
        location_accuracy: landslide["location_accuracy"],
        location_description: landslide["location_description"],
        longitude: landslide["longitude"],
        near: landslide["near"],
        trigger: landslide["trigger"],
        tstamp: landslide["tstamp"],
        external_id: "nasa-#{landslide['id']}")
      new_data.save
    end
  end

end
