class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound,with: :client_not_found


    def index
    render json:Client.all,status: :ok
    end
    
    def show
    client=find_client
    render json:client,status: :ok
    end
    
    
    def create
    client=Client.create!(client_params)
    render json:client,status: :created
    end
    
    def update
    client=find_client
    client.update(client_params)
    render json:client,status: :created
    end
    
    def destroy 
    client=find_client.destroy
    render json:{},status: :ok
    end
    
    private
    
    def client_params
    params.permit(:name,:age)
    end
    
    def client_not_found
    render json:{error:"Client not found"},status: :not_found
    end
    
    def find_client
    Client.find(params[:id])
    end
    
end
