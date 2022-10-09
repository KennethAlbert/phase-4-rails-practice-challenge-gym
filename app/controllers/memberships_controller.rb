class MembershipsController < ApplicationController
 rescue_from ActiveRecord::RecordNotFound,with: :membership_not_found

    def index
    render json:Membership.all,status: :ok
    end
     
    def create
    membership=Membership.create!(membership_params)
    render json:membership,status: :created
    end
    
    
    def destroy 
    membership=find_membership.destroy
    render json:{},status: :ok
    end
    
    private
    
    def membership_params
    params.permit(:gym_id,:client_id,:charge)
    end
    
    def membership_not_found
    render json:{error:"Membership not found"},status: :not_found
    end
    
    def find_membership
    Membership.find(params[:id])
    end

end
