module Routes
  module V1
    class Images < Grape::API
      version 'v1', using: :accept_version_header, vendor: 'offsidegaming'
      format :json
      content_type :json, 'application/json;charset=UTF-8'

      resource :images do
        desc ''
        get do
          cache_control :public, max_age: 60

          @images = Image.all
          serialize(@images, is_collection: true)
        end
      end
    end
  end
end
