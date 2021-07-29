# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :validate_url, only: %i[new edit index]
  add_flash_types :info, :error, :warning

  def index
    @employees = Employee.where(is_active: true)
  end

  def new
    @employee = Employee.new
  end

  def create
    employee = Employee.create(employee_params)
    employee.is_active = true
    employee.save
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
    if @employee.is_active 
        @employee.update(is_active: false)
        flash[:notice] = "Employee #{@employee.name} disabled succesfully."
    end

    redirect_to employees_path
  end

  def checkIn
    number = params[:private_num].to_i
    puts number
    @employee = Employee.find_by private_num: number
    if @employee
      redirect_to loginE_path,
      flash.alert = 'Welcome back ' << @employee.name << ' Check in succesfully on ' << Time.now.strftime('%H:%M') << I18n.l(
                    Date.today, format: ' %A, %d  %B  %Y'
                  )
    elsif flash.alert = 'User not found.'

      redirect_to loginE_path
    end
  end

  def logout
    number = params[:private_num].to_i
    puts number
    @employee = Employee.find_by private_num: number
    if @employee
      redirect_to loginE_path,
      flash.alert = 'See you soon ' << @employee.name << ' Check out succesfully on ' << Time.now.strftime('%H:%M') << I18n.l(
                    Date.today, format: ' %A, %d  %B  %Y'
                  )
    elsif flash.alert = 'User not found.'

      redirect_to loginE_path
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    data = params.require(:employee).permit(:name, :email, :is_active, :posicion, :num_empleado, :private_num)
  end

  def login
    @employee = Employee.new
  end
end
