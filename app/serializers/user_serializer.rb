class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :email

  has_many :lists
  def created_at
    object.created_at.iso8601
  end
end
