class ArtworksController < ApplicationController
    def index
        @art = Artwork.art_works_for_user_id(params[:user_id])
        render json: @art
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to artworks_url(@artwork.id)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to artworks_url
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save!
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end

    end

    private

    def artwork_params
        params.require(:artworks).permit(:title, :image_url, :artist_id)
    end
end