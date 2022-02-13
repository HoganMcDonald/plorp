class PlaidClient
  AUTHORIZATIONS = %w[auth transactions].freeze
  COUNTRY_CODES = ['US'].freeze
  LANGUAGE = 'en'.freeze

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

  def create_link_token(user)
    # Create the link_token with all of your configurations
    link_token_create_request = Plaid::LinkTokenCreateRequest.new({
      user: { client_user_id: user.id.to_s },
      client_name: user.name,
      products: AUTHORIZATIONS,
      country_codes: COUNTRY_CODES,
      language: LANGUAGE
    })

    link_token_response = @client.link_token_create(
      link_token_create_request
    )

    link_token_response.link_token
  end

  def create_access_token(public_token)
    request = Plaid::ItemPublicTokenExchangeRequest.new
    request.public_token = public_token

    response = @client.item_public_token_exchange(request)
    response.access_token
  end
end
