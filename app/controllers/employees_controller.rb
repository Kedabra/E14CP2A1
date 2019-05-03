class EmployeesController < ActionController::Base

  def create
    @employee = Employee.new(employee_params)
    @employee.company = @company

    if @employee.save!
      redirect_to @company
    end

  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to company_path(@company)
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :company_id, :area_id)
  end

end
