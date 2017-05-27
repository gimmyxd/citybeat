class Type < ApplicationRecord

  has_many :projects, through: :project_types
  has_many :project_types

  accepts_nested_attributes_for :projects, :allow_destroy => true

  validates :name, presence: true
  validates :name, length: { maximum: 50 }
  validates :name, uniqueness: true
end
