class Project < ApplicationRecord
  has_many :organizers
  has_many :volunteers
end
