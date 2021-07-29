# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :validate_url, only: %i[new edit index]

  def index
    @companies = Company.where(is_active: true)
  end

  def new
    @company = Company.new
  end

  def create
    company = Company.create(company_params)
    company.is_active = true
    company.save
    redirect_to companies_path
  end

  def edit
    set_company
  end

  def update
    set_company
    @company.update(company_params)

    redirect_to companies_path
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    data = params.require(:company).permit(:name, :address, :is_active)
  end

  def destroy
    set_company
    if @company.is_active
      @company.update(is_active: false)
      flash[:notice] = "Company #{@company.name} disabled succesfully."
    end

    redirect_to companies_path
  end
end
