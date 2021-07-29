class EmployeesController < ApplicationController
    before_action :validate_url, only: [:new, :edit, :index]
    add_flash_types :info, :error, :warning

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        Employee.create(employee_params)

        redirect_to employees_path
    end

    def edit
        set_employee
    end

    def update
        set_employee
        @employee.update(employee_params)
        redirect_to employees_path
    end

    def destroy
        set_employee
        @employee.destroy
        redirect_to employees_path
    end

    def checkIn
        
        number = params[:private_num].to_i
        puts number
        @employee = Employee.find_by private_num: number
        if @employee  
            redirect_to loginE_path,
                notice: 'Welcome back ' << @employee.name << ' Check in succesfully on '<<Time.now.strftime("%H:%M")  << I18n.l(Date.today, format: ' %A, %d  %B  %Y') 
        elsif
            
            flash.alert = "User not found."
            redirect_to loginE_path
        end

        
    end

    def logout
        number = params[:private_num].to_i
        puts number
        @employee = Employee.find_by private_num: number
        if @employee  
            redirect_to loginE_path,
                notice: 'See you soon ' << @employee.name << ' Check out succesfully on '<<Time.now.strftime("%H:%M")  << I18n.l(Date.today, format: ' %A, %d  %B  %Y') 
        elsif
            
            flash.alert = "User not found."
            redirect_to loginE_path
        end
    end
    private
    def set_employee
        @employee = Employee.find(params[:id])
    end

    
    def employee_params
        data = params.require(:employee).permit(:name, :email, :posicion, :num_empleado, :private_num)
    end

    def login
        @employee = Employee.new
    end
    
end
