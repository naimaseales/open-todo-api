class ListSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :user
  has_many :items

  # def title
  #   object.title
  # end
end
