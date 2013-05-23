require 'net/http'
require 'uri'
require 'json'

class BreweryDB
  @@base_url = 'http://api.brewerydb.com/v2/'
  
  
  def self.search(q)
    url = @@base_url + 'search'
    params = {:type => 'beer', :withBreweries => 'Y', :q => q}
    self.execute_request(url, params)
  end
  
  private
  def self.execute_request(url, params)
    params[:key] = ENV['BREWERY_DB_KEY']
    uri = URI.parse(url + '?' + params.to_query)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end


 