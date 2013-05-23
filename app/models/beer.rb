# == Schema Information
#
# Table name: beers
#
#  id                 :integer          not null, primary key
#  guid               :string
#  name               :string
#  description        :string
#  abv                :integer
#  ibu                :integer
#  is_organic         :boolean
#  label_url          :string
#  style_id           :string
#  brewery_id         :integer
#  remote_update_date :timestamp
#  created_at         :timestamp        not null
#  updated_at         :timestamp        not null
#

class Beer < ActiveRecord::Base
  attr_accessible :guid, :name, :description, :abv, :ibu, :is_organic, :label_url, :style_id, :brewery_id
  
  has_many :kegs
  belongs_to :style
  belongs_to :brewery
  
  def self.create_from_hash(beer_hash)
    beer = Beer.new
    
    brewery_hash = beer_hash['breweries'][0]
    if brewery_hash
      brewery = Brewery.find_by_guid(brewery_hash['id']) || Brewery.create_from_hash(brewery_hash)
      beer[:brewery_id] = brewery.id
    end
    
    style_hash = beer_hash['style']
    if style_hash
      style = Style.find_by_guid(style_hash['id']) || Style.create_from_hash(style_hash)
      beer[:style_id] = style.id
    end
  
    beer[:guid] = beer_hash['id']
    beer[:name] = beer_hash['name']
    beer[:description] = beer_hash['description']
    beer[:abv] = beer_hash['abv'].to_f if beer_hash['abv']
    beer[:ibu] = beer_hash['ibu'].to_i if beer_hash['ibu']
    beer[:is_organic] = (beer_hash['isOrganic'] == "Y")
    
    if beer_hash['labels']
      if beer_hash['labels']['large']
        beer[:label_url] = beer_hash['labels']['large']
      elsif beer_hash['labels']['medium']
        beer[:label_url] = beer_hash['labels']['medium']
      elsif beer_hash['labels']['icon']
        beer[:label_url] = beer_hash['labels']['icon']
      end
    end
    
    beer[:remote_update_date] = beer_hash['updateDate']
    
    puts 'BEER:' + beer.inspect
    
    beer.save!
    beer
  end
  
end
