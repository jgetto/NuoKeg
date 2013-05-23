# == Schema Information
#
# Table name: styles
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string
#  description :string
#  guid        :string
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#

require 'test_helper'

class StyleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
