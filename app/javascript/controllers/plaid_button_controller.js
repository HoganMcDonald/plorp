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
      const body = await post('/api/plaid/link_token', {})
      this.element.disabled = false
    } catch (e) {
      console.error(e)
      this.element.disabled = false
    }
  }
}
