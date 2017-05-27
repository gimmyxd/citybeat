class Volunteer < ApplicationRecord
  has_many :projects

  validates :firstname, :lastname, :email, :phone_number, :age, :cnp, :gender, presence: true
  validates_format_of :email, with: Devise.email_regexp
  validates :cnp, length: { maximum: 13 }
  validates :phone_number, length: { maximum: 10 }
end
