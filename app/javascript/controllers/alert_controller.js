import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['alert'];

  close() {
    this.alertTarget.classList.add('fade');
    this.alertTarget.classList.remove('show');

    setTimeout(() => {
      this.alertTarget.remove(); 
    }, 500);
  }
}
