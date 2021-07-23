class ReportsController < ApplicationController
  before_action :validate_url, only: [:new, :edit, :index]
  def index
    @report = Report.all
  end

  def new
    @report = Report.new
  end

  def create
    current_user.reports.create(report_params)
    redirect_to reports_path
  end

  def edit
    set_report
  end

  def update
    set_report
    @report.update(report_params)
    redirect_to reports_path
  end

  def destroy
    set_report
    @report.destroy
    redirect_to reports_path
  end

  private
    def set_report
        @report = Report.find(params[:id])
    end

    
    def report_params
        data = params.require(:report).permit(:report_type, :date, :description)
    end

end
