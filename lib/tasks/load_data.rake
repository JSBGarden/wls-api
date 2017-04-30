require 'net/http'
namespace :load_data do
  desc "TODO"
  task nasa_data: :environment do
    url = URI.parse('https://data.nasa.gov/resource/tfkf-kniw.json')
    req = Net::HTTP.get(url)
    binding.pry
  end

end
