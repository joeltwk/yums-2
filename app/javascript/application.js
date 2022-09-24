// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import * as Hammer from 'hammerjs';
window.Hammer = Hammer.default;
// import "./components/cards_deck.js"
