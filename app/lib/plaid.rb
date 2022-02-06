class PlaidClient
  def initialize
    configuration = Plaid::Configuration.new
    configuration.server_index = Plaid::Configuration::Environment[Plorp::PLAID_ENV]
    configuration.api_key['PLAID-CLIENT-ID'] = Plorp::PLAID_CLIENT_ID
    configuration.api_key['PLAID-SECRET'] = Plorp::PLAID_SECRET

    api_client = Plaid::ApiClient.new(
      configuration
    )

    @client = Plaid::PlaidApi.new(api_client)
  end
end
