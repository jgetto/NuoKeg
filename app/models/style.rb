# == Schema Information
#
# Table name: styles
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string(255)
#  description :text
#  guid        :string(255)
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#

class Style < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :guid
  
  has_many :beers
  belongs_to :category
  
  def self.create_from_hash(style_hash)
    style = Style.new
    style[:guid] = style_hash['id']
    style[:name] = style_hash['name']
    style[:description] = style_hash['description']
    
    category = Category.find_by_guid(style_hash['category']['id'])
    unless category
      category = Category.new
      category[:guid] = style_hash['category']['id']
      category[:name] = style_hash['category']['name']
      category.save!
    end
    
    style[:category_id] = category.id
    
    style.save!
    style
  end
  
end
