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

  scope :project_type_cont, ->(type) {
    includes(:types).references(:types).where('types.name ILIKE ?', type)
  }

  def self.ransackable_scopes(_auth_object)
    %i(project_type_cont)
  end

  def self.search_projects(fts)
    fts = fts.fetch(:search) if fts.present?
    if fts.present?
      includes(:types)
        .references(:types)
        .where(
          'title ILIKE ? OR  types.name ILIKE ? OR description ILIKE ?
          OR keywords ILIKE ? ', "%#{fts}%", "%#{fts}%", "%#{fts}%", "%#{fts}%"
        )
    else
      order(created_at: :desc)
    end
  end

  def chart_data
    result = {}
    articles.group_by(&:created_at).each do |day, articles|
      result[day.strftime('%m/%d/%Y')] = articles.count
    end
    result
  end
end
