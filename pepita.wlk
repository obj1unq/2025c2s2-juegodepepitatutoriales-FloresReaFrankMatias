
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
		if (energia > 0 && self.validarMover4(nuevaPos) ) { 
			self.position(nuevaPos)         
			self.volar(distancia)
			
		}else if (energia < 1) {
			game.removeTickEvent("caer")
    		game.say(self,"Pepita no tiene energía para moverse")
    		game.stop()
		//self.validarEnergia()
		}
	}
	method sinEnergia() {
	  
		game.say(self,"no tiene enrgia"  )
		game.stop()
	  
	}
//	method validarMover(nuevaPos) { 
//		 if ( self.position()== silvestre.position()  || self.dentroDeLosMargenes(nuevaPos)) {
//			self.error("Pepita no se pude mover ")
//		}
//		else if (self.hayMuroEnP(nuevaPos)){
//			self.error("Hay un Muroooooo")
//		}
//	}
	
	method volar(kms) {
		energia = energia - 9 - kms 	
	}
	

	



	method estaDentroDeLosMargenes(pos) {
  		return pos.x() >= 0 && pos.x() < game.width()
         	&& pos.y() >= 0 && pos.y() < game.height()
	}
	

	method validarMover4(nuevaPos) {
 	 return self.estaDentroDeLosMargenes(nuevaPos)   && not self.hayMuroEn(nuevaPos)
	}
	//--------------------  GRAVEDAD  Y MURO     --------------------------------------------
	const muros = [muro, muro2]
	method hayMuroEn(pos) {
  		return muros.any({ muro => pos == muro.position() })
	}
	method perderAltura() {
		const posAlCaer = game.at(position.x(), (position.y()-1).max(0))
		if(self.validarMover4(posAlCaer)){ 
			self.position(posAlCaer)
		}
	}
	method caer() {
		const posAlCaer= game.at(self.position().x(), self.position().y() - 1)
		if (self.validarMover4(posAlCaer)) {
			position = game.at(self.position().x(), self.position().y() - 1)
		}
	}
	
//------------------------  ESTADOS E IMAGEN   --------------------------
	method image() {
		return "pepita-" + self.estado().nombre()
	}
	method estado() {
		return if (energia <= 0) perdedora
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
      	game.removeTickEvent("caer")
		game.schedule(200, { game.stop() } )
	}
	}

method perder() {
  	game.say(self, "Perdi")
	game.removeTickEvent("caer")
    game.schedule(200, { game.stop() } )

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









