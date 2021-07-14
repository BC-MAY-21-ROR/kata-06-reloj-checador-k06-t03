class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end
    def new
        @employee = Employee.new
    end

    def create
        data = params.require(:employee).permit(:name, :email, :posicion, :num_empleado, :private_num)
        Employee.create(data)

        redirect_to employees_path
    end
end