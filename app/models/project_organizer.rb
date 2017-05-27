class ProjectOrganizer < ApplicationRecord
  belongs_to :project
  belongs_to :organizer
end
