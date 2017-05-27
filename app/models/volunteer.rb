class Volunteer < ApplicationRecord
  has_many :projects

  validates :firstname, :lastname, :email, :project_id, presence: true

  validates_format_of :email, with: Devise.email_regexp
  validates :email, uniqueness: true

  validates :cnp, length: { maximum: 13 }
  validates :cnp, numericality: true
  validates :phone_number, length: { maximum: 10 }
end
