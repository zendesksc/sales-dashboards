class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
