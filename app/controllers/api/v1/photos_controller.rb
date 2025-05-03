module Api
  module V1
    class PhotosController < ApplicationController
      def index
        @photos = Photo.all.order(created_at: :desc)
        render json: @photos.map { |photo| photo_data(photo) }
      end

      def create
        @photo = Photo.new(photo_params)

        if @photo.save
          render json: photo_data(@photo), status: :created
        else
          render json: { errors: @photo.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        @photo = Photo.find(params[:id])
        render json: photo_data(@photo)
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Photo not found" }, status: :not_found
      end

      private

      def photo_params
        params.require(:photo).permit(:title, :description, :camera, :lens,
                                    :aperture, :shutter_speed, :iso, :date_taken, :image)
      end

      def photo_data(photo)
        {
          id: photo.id,
          title: photo.title,
          description: photo.description,
          camera: photo.camera,
          lens: photo.lens,
          aperture: photo.aperture,
          shutter_speed: photo.shutter_speed,
          iso: photo.iso,
          date_taken: photo.date_taken,
          image_url: photo.image_url,
          created_at: photo.created_at,
          updated_at: photo.updated_at
        }
      end
    end
  end
end
