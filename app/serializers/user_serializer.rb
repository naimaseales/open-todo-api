class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :email

  has_many :lists

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
