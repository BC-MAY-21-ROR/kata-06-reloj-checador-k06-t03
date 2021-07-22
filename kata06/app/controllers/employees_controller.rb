class EmployeesController < ApplicationController

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

    private
    def set_employee
        @employee = Employee.find(params[:id])
    end

    
    def employee_params
        data = params.require(:employee).permit(:name, :email, :posicion, :num_empleado, :private_num)
    end

end