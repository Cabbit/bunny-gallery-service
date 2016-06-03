# frozen_string_literal: true
class ImageSerializer
  include JSONAPI::Serializer

  attribute :name
  attribute :photo
end
