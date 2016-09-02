class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :email

  has_many :lists
  has_many :items
  def created_at
    object.created_at.iso8601
  end
end
