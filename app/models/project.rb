class Project < ApplicationRecord
  has_many :organizers, through: :project_organizers
  has_many :project_organizers

  has_many :volunteers, through: :project_volunteers
  has_many :project_volunteers

  has_many :types, through: :project_types
  has_many :project_types

  accepts_nested_attributes_for :organizers, :allow_destroy => true
  accepts_nested_attributes_for :volunteers, :allow_destroy => true
  accepts_nested_attributes_for :types, :allow_destroy => true


  has_many :articles

  validates :title, :description, :keywords, :status, :photo, presence: true

  validates :description, length: { maximum: 1000 }
  validates :title, length: { maximum: 100 }
  validates :status, length: { maximum: 50 }
  validates :keywords, length: { maximum: 200 }

  validates :title, uniqueness: true

  scope :search_projects, -> (fts) {
    includes(:types).references(:types)
        .where('title ILIKE ? OR  types.name ILIKE ? OR description ILIKE ? OR keywords ILIKE ? ', "%#{fts}%", "%#{fts}%", "%#{fts}%", "%#{fts}%")
  }

  def chart_data
    @articles_per_day = articles.group_by { |article| article.created_at }
  end
end
