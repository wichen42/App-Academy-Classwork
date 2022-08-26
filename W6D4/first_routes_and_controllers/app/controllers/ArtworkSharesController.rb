class ArtworkSharesController < ApplicationController

    def create
        @asc = ArtworkShare.new(asc_params)
        if @asc.save! 
            render json: @asc
        else
            render json: @asc.errors.full_messages, status: 422
        end
    end

    def destroy
        @asc = ArtworkShare.find(params[:id])
        @asc.destroy
        @all_asc = ArtworkShare.all
        render json: @all_asc
    end


    private

    def asc_params
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    end
end