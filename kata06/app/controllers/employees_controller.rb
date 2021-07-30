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
    number = params[:employee]
    puts number[:private_num]  
    @employee = Employee.find_by private_num: number[:private_num].to_i
    if @employee
      logs = LogTime.create({logtype:'checkin',logdate:Time.now.strftime("%d-%m-%Y %H:%M")	,employee_id:@employee.id})
      redirect_to loginE_path,
       notice: 'Welcome back ' + @employee.name + ' Check in succesfully on ' + Time.now.strftime('%H:%M') + I18n.l(Date.today, format: ' %A, %d  %B  %Y')
    elsif flash.alert = 'User not found.'

      redirect_to loginE_path
    end
  end

  def logout
    number = params[:employee]
    puts number[:private_num]  
    @employee = Employee.find_by private_num: number[:private_num].to_i
        if @employee  
            logs = LogTime.create({logtype:'checkout',logdate:Time.now.strftime("%d-%m-%Y %H:%M")	,employee_id:@employee.id})
            redirect_to loginE_path,
                notice: 'See you soon ' + @employee.name + ' Check out succesfully on ' + Time.now.strftime("%H:%M")  + I18n.l(Date.today, format: ' %A, %d  %B  %Y') 
        elsif
            
            flash.alert = "User not found."
            redirect_to loginE_path
        end
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    data = params.require(:employee).permit(:name, :email, :is_active, :posicion, :num_empleado, :private_num)
  end

  def login
    @employee = Employee.new
    render layout: 'admin'
  end
end
