class V1::PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published_at, :author

  def published_at
    object.published_at.strftime "%Y-%m-%d %H:%M:%S"
  end
end
