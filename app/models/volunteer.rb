class Volunteer < ApplicationRecord

  has_many :projects, through: :project_volunteers
  has_many :project_volunteers

  accepts_nested_attributes_for :projects, :allow_destroy => true

  validates :firstname, :lastname, :email, presence: true

  validates_format_of :email, with: Devise.email_regexp
  validates :email, uniqueness: true

  validates :phone_number, length: { maximum: 10 }
end