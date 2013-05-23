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

require 'test_helper'

class KegTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
