
import pepita.*
// Nido
object nido {
	method image() = "nido.png"
	method position() = game.center()
}





/// SILVESTRE
object silvestre {
  
	method image() =  "silvestre.png" 
	var property position = game.at(3,0) 

	method moverse() {
		position = game.at( 3.max(pepita.position().x()), 0  )

	}

	method position(nuevaPosition){
		position = nuevaPosition
		
	}
	
}

