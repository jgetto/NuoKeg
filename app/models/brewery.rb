# == Schema Information
#
# Table name: breweries
#
#  id                 :integer          not null, primary key
#  guid               :string
#  name               :string
#  description        :string
#  website            :string
#  established        :integer
#  is_organic         :boolean
#  image_url          :string
#  remote_update_date :timestamp
#  created_at         :timestamp        not null
#  updated_at         :timestamp        not null
#

class Brewery < ActiveRecord::Base
  attr_accessible :description, :established, :guid, :image_url, :is_organic, :name, :remote_update_date, :website
  
  has_many :beers
  
  def self.create_from_hash(brewery_hash)
    brewery = Brewery.new
    brewery[:guid] = brewery_hash['id']
    brewery[:name] = brewery_hash['name']
    brewery[:description] = brewery_hash['description']
    brewery[:website] = brewery_hash['website']
    brewery[:remote_update_date] = brewery_hash['updateDate']

    if brewery_hash['images']
      if brewery_hash['images']['large']
        brewery[:image_url] = brewery_hash['images']['large']
      elsif brewery_hash['images']['medium']
        brewery[:image_url] = brewery_hash['images']['medium']
      elsif brewery_hash['images']['icon']
        brewery[:image_url] = brewery_hash['images']['icon']
      end
    end
    
    brewery.save!
    brewery
  end
  
end
