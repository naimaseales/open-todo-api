class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description

  belongs_to :list
end
