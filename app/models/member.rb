# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :blogs
  belongs_to :role
end
