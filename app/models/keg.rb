# == Schema Information
#
# Table name: kegs
#
#  id         :integer          not null, primary key
#  beer_id    :integer
#  start_date :timestamp
#  end_date   :timestamp
#  is_on_tap  :boolean          default(FALSE)
#  created_at :timestamp        not null
#  updated_at :timestamp        not null
#

class Keg < ActiveRecord::Base
  attr_accessible :beer_id, :end_date, :start_date, :is_on_tap

  belongs_to :beer
  
  scope :past, where('start_date IS NOT ?', nil).where('end_date IS NOT ?', nil).order('end_date DESC')
  
  def self.current
    @kegs = Keg.where(:end_date => nil).where('is_on_tap' => true)
    @kegs.concat(Keg.where(:end_date => nil).where('is_on_tap' => false).order('id'))
  end
  
  def self.most_recent_for_beer(beer) 
    Keg.where(:beer_id => beer.id).where('end_date < ?', Time.now).order(:start_date).first
  end
end
