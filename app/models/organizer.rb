class Organizer < ApplicationRecord
  has_many :projects

  validates :name, :description, :funds, presence: true
  validates :description, length: { maximum: 200 }
end
