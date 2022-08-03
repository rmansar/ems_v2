  class DetailsController < ApplicationController
    def index
      @employee= Employee.all
      if employee_signed_in?
        @one_employee=Employee.find(current_employee_id)
      end
    end

  def show
    if admin_signed_in?
      @employee = Employee.find(params[:id])
    else
      redirect_to admin_session_path
      end
  end

  def edit
    if admin_signed_in? or employee_signed_in?

      @detail = Detail.find(params[:id])
      @detail.save
    else
      redirect_to admin_session_path
    end
  end

    def update
      @detail = Detail.find(params[:id])
      if @detail.update(detail_params)
        flash[:notice] = "Basic details was updated successfully"
        if admin_signed_in?
          redirect_to detail_path(@detail.employee.id)
        else
          redirect_to root_path
        end
      else
        render edit_detail_path
      end
    end
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
  end
  private
  def detail_params
    params.require(:detail).permit(:name, :email, :dob, :father_name ,:mother_name, :phone_number, :address, :experience, :employee_id)
  end
  end