require 'uri'

class Dashboard < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates_format_of :url, :with => URI.regexp(['https'])
end