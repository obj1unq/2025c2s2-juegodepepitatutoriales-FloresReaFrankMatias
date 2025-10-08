import wollok.game.*
import pepita.*
import randomizer.*

object manzanaFactory {
	method crear() {
		return new Manzana( position = randomizer.emptyPosition())
  }
}

object alpisteFactory {
  	method crear() {
		return new Alpiste( position = randomizer.emptyPosition(), peso= 40.randomUpTo(100) )
  	}
}

class Manzana {
	const base= 5
	var madurez = 1
	
	//var property position //= game.at(7, 7)
	const property position 
	
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

class Alpiste {
  	const property position //= game.at(2, 5)
	var  property  image =  "alpiste.png"
	const property peso
	
	method energiaQueOtorga() {
		return peso
	} 

  method colisionarConPepita() {
    	pepita.comer(self)
		 // game.say(pepita,"Comí el alpiste!")
		  game.removeVisual(self)
	
  }
	
}



object comidas {
  
	const factories = [ alpisteFactory, manzanaFactory ]
	const property comidasTotales = #{}
	method comenzar() {
	  game.onTick(3000, " comidas random ", {self.nuevaComida()}  )
	}
	method nuevaComida(){
		if ( comidasTotales.size() < self.maximo() ){ 
	
			const comida =  self.crearComida()// new Manzana( position = randomizer.emptyPosition()  )	
			game.addVisual(comida )
			comidasTotales.add(comida)
	
		}
	}

	//Factorimethod
	method crearComida() {
		//return if( (0..1).anyOne() == 0  ) new Manzana( position = randomizer.emptyPosition())  
	      //     else new Alpiste( position = randomizer.emptyPosition(), peso= 40.randomUpTo(100) )
		return  factories.anyOne().crear()
	}




	method maximo() {
	  return 5
	}
	method removerComida(comida) {
	  if( comidasTotales.contains(comida) ){
			comidasTotales.remove(comida)
			game.removeVisual(comida)	
		}
	}
}



