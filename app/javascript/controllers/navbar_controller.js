import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  // static targets = ['ethnicity', 'age', 'gender', 'height']
  // static targets = ['location']

  connect() {
    this.doppelgangerCardsList = document.getElementById("doppelgangers_cards")
    // console.log(this.doppelgangerCards);

    this.location = document.getElementById("location")
    // console.log(this.location);

    this.ethnicity = document.getElementById("ethnicity")
    // console.log(this.ethnicity);

    this.age = document.getElementById("age")
    // console.log(this.age);

    this.gender = document.getElementById("gender")
    // console.log(this.gender);

    this.height = document.getElementById("height")
    this.locationFilter()
    // console.log(this.height);
  }
  setCards() {
    this.doppelgangerCards = document.querySelectorAll(".card-dg-index")
  }

  insertIntoDom(cards) {
    this.doppelgangerCardsList.innerHTML = ""
    cards.forEach(card => {
      console.log(card.innerHTML);
      this.doppelgangerCardsList.insertAdjacentHTML("beforeend", card.innerHTML)
    })
  }

  locationFilter() {
    this.location.addEventListener('change', (event) => {
      this.setCards()
      // console.log(event.currentTarget.value);
      const filteredCards = []
      this.doppelgangerCards.forEach((card) => {
        if(card.dataset.location === event.currentTarget.value) {
          filteredCards.push(card)
        }
      })
      // console.log(filteredCards);
      this.insertIntoDom(filteredCards)
    })
  }

}
