class Item < ActiveRecord::Base
  belongs_to :list
  validates :completed, inclusion: { in: [true, false] }
end
