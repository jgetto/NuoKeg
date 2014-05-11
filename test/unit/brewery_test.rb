# == Schema Information
#
# Table name: breweries
#
#  id                 :integer          not null, primary key
#  guid               :string(255)
#  name               :string(255)
#  description        :text
#  website            :string(255)
#  established        :integer
#  is_organic         :boolean
#  image_url          :string(255)
#  remote_update_date :timestamp
#  created_at         :timestamp        not null
#  updated_at         :timestamp        not null
#

require 'test_helper'

class BreweryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
