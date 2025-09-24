
import  extras.*


object pepita {
	var energia = 100
  	const perseguidor = silvestre
	const objetivo = nido  	

	var property position = game.at(0,4)
	method nido() = "nido.png"
	
	
  	
	


	method image() {
	return "pepita-" + self.estado().nombre()
	
	  
	  	
	}

	method estado() {
		return if (position == objetivo.position()) ganadora
	            else if  ( position == perseguidor.position())    perdedora
			   else libre
	}

	method mover(dir) {
	  position = dir.siguiente(position)
	}

	
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}
	
	

}


object ganadora {
  method nombre() {
	return "ganadora.png"
  }
}

object perdedora {
  method nombre() {
	return "perdedora.png"
  }
}


object libre {
  method nombre() {
	return "libre.png"
  }
}









