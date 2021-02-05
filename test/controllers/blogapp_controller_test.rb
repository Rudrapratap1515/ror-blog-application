# frozen_string_literal: true

require 'test_helper'

class BlogappControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get blogapp_index_url
    assert_response :success
  end
end
