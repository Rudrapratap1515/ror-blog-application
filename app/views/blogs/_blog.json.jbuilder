# frozen_string_literal: true

json.extract! blog, :id, :title, :read_time, :image, :body, :category_id, :member_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
