# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :validate_url, only: %i[new edit index]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    Company.create(company_params)

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

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    data = params.require(:company).permit(:name, :address)
  end

  def destroy
    set_company
    @company.destroy

    redirect_to companies_path
  end
end
