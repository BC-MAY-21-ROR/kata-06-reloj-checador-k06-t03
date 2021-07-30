# frozen_string_literal: true

class Employee < ApplicationRecord
    has_many :log_times
end
