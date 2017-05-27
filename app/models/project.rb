class Project < ApplicationRecord
  has_many :organizers
  has_many :volunteers

  validates :title, :description, :keywords, :status, :photo, presence: true
  validates :description, length: { maximum: 200 }
  validates :title, length: { maximum: 30 }
  validates :status, length: { maximum: 10 }
  validates :keywords, length: { maximum: 100 }
end
