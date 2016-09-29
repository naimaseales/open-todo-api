class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :completed

  belongs_to :list
end
