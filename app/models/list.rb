class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :title, presence: true
  validates :permission, inclusion: { in: %w(private viewable open) }
end
