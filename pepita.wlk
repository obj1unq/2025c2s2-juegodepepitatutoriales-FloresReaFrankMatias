
object pepita {
	var energia = 500
  	var property image = "pepita.png"
	
	
	method nido() = "nido.png"
	var property position = game.at(0,4)
  	method position(nuevaPosition) {
	  position = nuevaPosition
	
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
	method izq() {
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
	

}

