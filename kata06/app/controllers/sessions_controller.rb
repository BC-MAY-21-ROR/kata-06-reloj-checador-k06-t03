class SessionsController < ApplicationController
    
    def new
        @administrator = Administrator.new
    end

    def create
        @administrator = Administrator.find_by username:params[:username]
        if @administrator && @administrator.authenticate(params[:password])
            session[:administrator_id] = @administrator.id

            return redirect_to employees_path
        end

        redirect_to login_path
        
    end

    def destroy
        session[:administrator_id] = nil
        redirect_to login_path
    end

end