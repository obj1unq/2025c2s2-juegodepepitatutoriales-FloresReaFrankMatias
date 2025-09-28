
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
	//const nuevaX = newPosicion.x().max(0).min(12)
	//const nuevaY = newPosicion.y().max(0).min(12)
	method position(newPosicion) {
		//const nuevaX = newPosicion.x().max(0).min(game.width() - 1)
   		//const nuevaY = newPosicion.y().max(0).min(game.height() - 1)
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
		 if (energia < 1) {
			self.error("Pepita no tiene suficiente energía")
		}
		if (nuevaPos.x() < 0 || nuevaPos.x() >= game.width()
			|| nuevaPos.y() < 0 || nuevaPos.y() >= game.height()) {
			console.println( "No puedo moverme")
			self.error( "No puedo salir del tablero ")
		}
		if (self.hayMuroEnP(nuevaPos)){
			self.error("Hay un Muroooooo")
		}
	}
	method volar(kms) {
		energia = energia - 9 - kms 
		
	}
	//--------------------  GRAVEDAD  Y MURO     --------------------------------------------
	method hayMuroEnP(posicion) {
		return (posicion == muro.position()) || (posicion == muro2.position())
	
	}
	method perderAltura() {
		const posAlCaer = game.at(position.x(), (position.y()+1).max(0))
		if (position.y() < game.height() - 1 && energia > 0 && not self.hayMuroEnP( posAlCaer) ) {
			self.position(posAlCaer)
		}
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









