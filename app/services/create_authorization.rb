class CreateAuthorization < SmartInit::Base
  initialize_with :access_token
  is_callable

  def call
    ActiveRecord::Base.transaction do
      create_authorization!
    end
  end

  private

  def create_authorization!
    Authorization.create! access_token: @access_token
  end
end
