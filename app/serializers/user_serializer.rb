class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :email

  has_many :lists

  def email
    object.email
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
