class Department < ApplicationRecord
  validates :name, presence: true
  has_many :dashboards
  belongs_to :region
end
