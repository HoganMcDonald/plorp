class SpendingPlansController < ApplicationController
  before_action :set_budget, only: %i[ new edit create update destroy ]
  before_action :set_accounts, only: %i[ new edit create update update ]
  before_action :set_spending_plan, only: %i[ edit update destroy ]

  def new
    @spending_plan = SpendingPlan.new budget: @budget
  end

  def edit; end

  def create
    @spending_plan = SpendingPlan.new(spending_plan_params)
    @spending_plan.budget = @budget

    if @spending_plan.save
      redirect_to budget_url(@budget), notice: 'Spending plan was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @spending_plan.update(spending_plan_params)
        format.html { redirect_to spending_plan_url(@spending_plan), notice: 'Spending plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @spending_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spending_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @spending_plan.destroy

    respond_to do |format|
      format.html { redirect_to spending_plans_url, notice: 'Spending plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spending_plan
      @spending_plan = SpendingPlan.find_by!(budget: @budget, id: params[:id])
    end

    def set_budget
      @budget = current_user.budgets.find(params[:budget_id])
    end

    def set_accounts
      @accounts = @budget.accounts
    end

    # Only allow a list of trusted parameters through.
    def spending_plan_params
      params.require(:spending_plan).permit(:account_id, :limit)
    end
end
