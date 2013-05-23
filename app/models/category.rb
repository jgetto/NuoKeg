# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  guid       :string
#  created_at :timestamp        not null
#  updated_at :timestamp        not null
#

class Category < ActiveRecord::Base
  attr_accessible :name, :guid
  
  has_many :styles
end
