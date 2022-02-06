module Plorp
  PLAID_ENV = Rails.application.credentials.send(Rails.env.to_sym).send(:plaid_env!)
  PLAID_CLIENT_ID = Rails.application.credentials.send(Rails.env.to_sym).send(:plaid_client_id!)
  PLAID_SECRET = Rails.application.credentials.send(Rails.env.to_sym).send(:plaid_secret!)
end
