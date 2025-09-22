
object pepita {
	var energia = 100
  	var imagen = "pepita.png"
	method image() = imagen
  	  	
	method nido() = "nido.png"
	var property position = game.at(0,4)
  	method position(nuevaPosition) {
	  position = nuevaPosition
		self.colisionarConSilvestre()
		self.llegarANido()
	}
	
	method subir() {
    	position = position.up(1)
  	}
	method bajar() {
	  position = position.down(1)
	}
	method derecha() {
	  position = position.right(1)
	}
	method izq(c) {
	  position = position.left(1)
	}
	method enDiagonal(cantidadPosiciones) {
    	position = position.up(cantidadPosiciones).right(cantidadPosiciones)
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
	method llegarANido() { 
		if(self.position() == nido.position()){ 
			imagen = "pepita-grande.png"
		}	 
	}
	method colisionarConSilvestre() {
	  if(self.position() == silvestre.position()){
		imagen = "pepita-gris.png"	
	  }
	  
	}

}
object nido {
  method image() = "nido.png"
	method position() = game.center()
}

object silvestre {
  
	method image() =  "silvestre.png" 
	var property position = game.origin() 

	method moverse() {
		position = game.at( pepita.position().x(), 0  )

	}

	method position(nuevaPosition){
		position = nuevaPosition
		
	}
	
}
