import wollok.game.*
import pepita.*

object manzana {
	const base= 5
	var madurez = 1
	var property position = game.at(7, 7)
	var  property  image =  "manzana.png"
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}

	 method colisionarConPepita() {
    	pepita.comer(self)
		//game.say(pepita,"Comí la manzana!")
		game.removeVisual(self)
  }

}

object alpiste {
  var property position = game.at(2, 5)
	var  property  image =  "alpiste.png"
	method energiaQueOtorga() {
		return 20
	} 

  method colisionarConPepita() {
    	pepita.comer(self)
		 // game.say(pepita,"Comí el alpiste!")
		  game.removeVisual(self)
	
  }
	
}

