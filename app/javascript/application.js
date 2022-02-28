// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("submit", (e) => {
  errorMessage()
  moveProviderToTop(e)
})

function errorMessage() {
  const error = document.querySelector(".error")
  if(error) {
    error.remove()
  }
}

function moveProviderToTop(e) {
  const tr = document.querySelector(`[data-id="${e.target[0].value}"]`)
  if(tr) {
    e.preventDefault()
    const tbody = document.querySelector("tbody")
    tbody.insertBefore(tr, tbody.children[0])
    document.querySelector("form").reset()
  }
  
}

