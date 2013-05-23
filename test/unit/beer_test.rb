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

require 'test_helper'

class BeerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
