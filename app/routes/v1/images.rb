# frozen_string_literal: true
module Routes
  module V1
    class Images < Grape::API
      version 'v1', using: :accept_version_header, vendor: 'cabbit'
      format :json
      content_type :json, 'application/json;charset=UTF-8'
      rescue_from ActiveRecord::RecordNotFound do
        error!({ error: 'No image found.' }, 404, 'Content-Type' => 'text/error')
      end

      resource :images do
        desc ''
        get do
          cache_control :public, max_age: 15

          images = Image.all
          serialize(images, is_collection: true)
        end

        params do
          requires :avatar, type: File
        end
        post do
          image = Image.new
          image.name  = params.avatar.filename
          image.photo = params.avatar
          image.save
          image.photo
        end

        route_param :id do
          desc ''
          get do
            cache_control :public, max_age: 60

            image = Image.find(params[:id])
            serialize(image, is_collection: false)
          end

          get :full_image do
            cache_control :public, max_age: 60
            content_type :jpg

            image = Image.find(params[:id])
            stream open(image.photo.url)
          end

          get :thumb do
            cache_control :public, max_age: 60
            content_type :jpg

            image = Image.find(params[:id])
            file open(image.photo.url(:thumb))
          end
        end
      end
    end
  end
end
