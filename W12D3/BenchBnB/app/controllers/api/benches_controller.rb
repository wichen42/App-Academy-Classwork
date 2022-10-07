class Api::BenchesController < ApplicationController

    def index
        @benches = Bench.all()
        
        render :index
    end

    def create
        @bench = Bench.new(bench_params)
        if @bench.save!
            render :show
        end
    end

    def show
        @bench = Bench.find_by(id: params[:id])

        if @bench 
            render :show
        else
            render json: "Bench not found", status: :not_found
        end
    end

    private 

    def bench_params
        params.require(:bench).permit(:title, :description, :price, :seating, :lat, :lng)
    end

end