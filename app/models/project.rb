class Project < ApplicationRecord
  has_many :organizers
  has_many :volunteers
  has_many :articles

  validates :title, :description, :keywords, :status, :photo, :organizer_id, presence: true

  validates :description, length: { maximum: 1000 }
  validates :title, length: { maximum: 100 }
  validates :status, length: { maximum: 50 }
  validates :keywords, length: { maximum: 200 }

  validates :title, uniqueness: true
end
