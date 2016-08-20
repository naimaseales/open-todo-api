class ListSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :user
  has_many :items

  def title
    object.title
  end

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :email

    has_many :lists

    def email
      object.email
    end

    def created_at
      object.created_at.strftime('%B %d, %Y')
    end

    class ListSerializer < ActiveModel::Serializer
      attributes :title

      has_many :items

      class ItemSerializer < ActiveModel::Serializer
        attributes :id, :description

        belongs_to :list

        def description
          object.description
        end
      end
    end
  end
end
