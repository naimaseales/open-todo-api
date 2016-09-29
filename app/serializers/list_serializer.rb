class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :permission

  belongs_to :user
  has_many :items

end
