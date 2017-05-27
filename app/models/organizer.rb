class Organizer < ApplicationRecord
  has_many :projects, through: :project_organizers
  has_many :project_organizers

  accepts_nested_attributes_for :projects, :allow_destroy => true

  validates :name, :description, :funds, presence: true

  validates :description, length: { maximum: 1000 }

  validates :name, uniqueness: true
end
