# == Schema Information
#
# Table name: beers
#
#  id                 :integer          not null, primary key
#  guid               :string(255)
#  name               :string(255)
#  description        :text
#  abv                :float
#  ibu                :integer
#  is_organic         :boolean
#  label_url          :string(255)
#  style_id           :string(255)
#  brewery_id         :integer
#  remote_update_date :timestamp
#  created_at         :timestamp        not null
#  updated_at         :timestamp        not null
#

require 'test_helper'

class BeerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
