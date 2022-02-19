class CreateAuthorization < SmartInit::Base
  initialize_with :access_token, :budget
  is_callable

  def call
    ActiveRecord::Base.transaction do
      create_authorization!
      create_accounts!
    end
  end

  private

  def create_authorization!
    @authorization = Authorization.create! access_token: @access_token, budget: @budget
  end

  def create_accounts!
    plaid_accounts = @authorization.plaid_accounts
    @accounts = plaid_accounts.map do |pa|
      Account.create!(
        authorization: @authorization,
        plaid_id: pa.account_id,
        name: pa.name,
        account_type: pa.type.parameterize.underscore,
        account_sub_type: pa.subtype.parameterize.underscore,
        balance: pa.balances.current,
        limit: pa.balances.limit
      )
    end
  end
end
