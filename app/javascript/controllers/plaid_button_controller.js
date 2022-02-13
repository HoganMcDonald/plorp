import { Controller } from '@hotwired/stimulus'
import { post } from '../helpers/api'

export default class extends Controller {
  connect() {
    this.linkToken = null
  }

  handleClick() {
    this.element.disabled = true
    this.createLinkToken()
  }

  async createLinkToken() {
    try {
      const { link_token } = await post('/api/plaid/link_token', {})
      Plaid.create({
        token: link_token,
        // receivedRedirectUri: window.location.href,
        onLoad: function () {
          // optional when link loads
        },
        onSuccess: function (public_token, metadata) {
          // Send the public_token to your app server.
          // The metadata object contains info about the institution the
          // user selected and the account ID or IDs, if the
          // Account Select view is enabled.
          post('/api/plaid/access_token', { public_token, metadata })
        },
        onExit: function (err, metadata) {
          // The user exited the Link flow.
          if (err != null) {
            // The user encountered a Plaid API error prior to exiting.
          }
          // metadata contains information about the institution
          // that the user selected and the most recent API request IDs.
          // Storing this information can be helpful for support.
        },
        onEvent: function (eventName, metadata) {
          // Optionally capture Link flow events, streamed through
          // this callback as your users connect an Item to Plaid.
          // For example:
          // eventName = "TRANSITION_VIEW"
          // metadata  = {
          //   link_session_id: "123-abc",
          //   mfa_type:        "questions",
          //   timestamp:       "2017-09-14T14:42:19.350Z",
          //   view_name:       "MFA",
          // }
        },
      }).open()
      this.element.disabled = false
    } catch (e) {
      console.error(e)
      this.element.disabled = false
    }
  }
}
