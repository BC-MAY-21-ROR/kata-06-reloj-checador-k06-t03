# frozen_string_literal: true

class Administrator < ApplicationRecord
  has_secure_password
  has_many :reports
end
