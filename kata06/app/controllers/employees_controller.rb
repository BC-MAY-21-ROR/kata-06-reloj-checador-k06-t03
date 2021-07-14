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

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        data = params.require(:employee).permit(:name, :email, :posicion, :num_empleado, :private_num)
        @employee.update(data)

        redirect_to employees_path
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy

        redirect_to employees_path
    end

end