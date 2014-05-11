# == Schema Information
#
# Table name: taps
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :timestamp        not null
#  updated_at :timestamp        not null
#

class Tap < ActiveRecord::Base
  attr_accessible :name
  
  has_many :kegs
  has_many :beers, :through => :kegs  
end
