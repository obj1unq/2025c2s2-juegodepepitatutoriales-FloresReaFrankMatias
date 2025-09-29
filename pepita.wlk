
import  extras.*
import comidas.*


object pepita {
	var energia = 500
	var  position = game.origin()
  	const perseguidor = silvestre
	const objetivo = nido  	
	var property comidas  = 2 
	
	method energia() {
		return energia
	}

// ----------------------   POSICION Y MOVIMIENTOS  --------------------------------------------	
	
	
	method position(newPosicion) {
		//const nuevaX = newPosicion.x().max(0).min(game.width() - 1)
   		//const nuevaY = newPosicion.y().max(0).min(game.height() - 1)
		//const nuevaX = newPosicion.x().max(0).min(12)
		//const nuevaY = newPosicion.y().max(0).min(12)
		position = game.at(newPosicion.x(), newPosicion.y())
	}
	method position() {
	  return position
	}

	method mover(dir) {
		const nuevaPos = dir.siguiente(position) 
		const distancia = position.distance(nuevaPos)
		self.validarMover(nuevaPos)  
		self.position(nuevaPos)         
		self.volar(distancia)
		self.validarEnergia()
	}
	method validarEnergia() {
	  if(energia < 1){
		self.error("no tiene enrgia"  )
		game.stop()
	  }
	}
	method validarMover(nuevaPos) { 
		 if (energia < 1 || self.position()== silvestre.position()  || self.dentroDeLosMargenes(nuevaPos)) {
			self.error("Pepita no se pude mover ")
		}
		else if (self.hayMuroEnP(nuevaPos)){
			self.error("Hay un Muroooooo")
		}
	}
	method volar(kms) {
		energia = energia - 9 - kms 	
	}
	

	method dentroDeLosMargenes(sigPosicion) {
	  return (sigPosicion.x() < 0 || sigPosicion.x() >= game.width()
			     ||  sigPosicion.y() < 0 || sigPosicion.y() >= game.height()) 
	} 
	//--------------------  GRAVEDAD  Y MURO     --------------------------------------------
	method hayMuroEnP(posicion) {
		return (posicion == muro.position()) || (posicion == muro2.position())
	
	}
	method perderAltura() {
		const posAlCaer = game.at(position.x(), (position.y()-1).max(0))
		self.validarMover(posAlCaer)
		self.position(posAlCaer)
		
	}
	
//------------------------  ESTADOS E IMAGEN   --------------------------
	method image() {
		return "pepita-" + self.estado().nombre()
	}
	method estado() {
		return if (energia <= 0) sinEnergia
		       else if (position == objetivo.position()) ganadora
		       else if (position == perseguidor.position()) perdedora
		       else libre
	}

///--------------------   COMIDA     --------------------------------
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		comidas -= 1
	}

	
//------------------------------------------------------
	method ganar() {
	  if (self.comidas() == 0 ){ 
      game.say(self,"¡GANE!")
      //game.tick(2000, game.stop() , false)
      game.removeTickEvent("caer")
      // game.onTick(2000, "parar juego", {game.stop()})
		game.schedule(2000, { game.stop() } )
	}
	}

method perder() {
  	game.say(self,"¡PERDÍ!")
    //game.onTick(2000, "Perder" , {game.stop()})		
    game.schedule(2000, { game.stop() } )

}
//-------------------------TEXT ENERGIA  ------------------------------
	method text() {	return "" + energia + ""	}
	method textColor() = paleta.verde()
}

object paleta {
  const property verde = "00FF00FF"
  const property rojo = "FF0000FF"
}

//       --------------------------------   ESTADOS DE PEPITA --------------------------------

object sinEnergia {
  method nombre() {return "perdedora.png"}
}
object ganadora {
  method nombre() {return "ganadora.png"}
}

object perdedora {
  method nombre() {return "perdedora.png"}
}
object libre {
  method nombre() {return "libre.png" }
}









