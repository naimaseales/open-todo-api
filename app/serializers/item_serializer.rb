class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description

  belongs_to :list

  def description
    object.description
  end
end

class ListSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_many :items

  def title
    object.title
  end

  class ItemSerializer < ActiveModel::Serializer
    attributes :description

    # def description
    #   object.description
    # end
  end
end
