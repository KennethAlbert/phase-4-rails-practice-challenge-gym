class GymsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound,with: :gym_not_found


    def index
    render json:Gym.all,status: :ok
    end
    
    def show
    gym=find_gym
    render json:gym,status: :ok
    end
    
    
    def create
    gym=Gym.create!(gym_params)
    render json:gym,status: :created
    end
    
    def update
    gym=find_gym
    gym.update(gym_params)
    render json:gym,status: :created
    end
    
    def destroy 
    gym=find_gym.destroy
    render json:{},status: :ok
    end
    
    private
    
    def gym_params
    params.permit(:name,:address)
    end
    
    def gym_not_found
    render json:{error:"Gym not found"},status: :not_found
    end
    
    def find_gym
    Gym.find(params[:id])
    end
end
