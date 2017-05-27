class ProjectType < ApplicationRecord
  belongs_to :project
  belongs_to :type
end
