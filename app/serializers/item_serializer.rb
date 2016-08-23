class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description

  belongs_to :list

  # def description
  #   object.description
  # end
end
