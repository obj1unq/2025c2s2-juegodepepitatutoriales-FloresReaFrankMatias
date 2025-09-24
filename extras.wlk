import pepita.*


/// Nido
object nido {
  method image() = "nido.png"
	method position() = game.center()
}

import pepita.*
// Nido
object nido {
	method image() = "nido.png"
	method position() = game.center()
}





/// SILVESTRE
object silvestre {
    const presa = pepita

	method image() =  "silvestre.png" 
	
    var property position = game.at(3,0) 

	//method moverse() {
	//	position = game.at( 3.max( pepita.position().x() ), 0  )

	//}
	method position(){
		return game.at(3.max( presa.position().x()), 0 )	
	}
	
}




object derecha {
  method siguiente(position) {
    return position.right(1)
  }
}

object abajo {
  method siguiente(position) {
    return position.down(1)
  }
}
object izquierda {
  method siguiente(position) {
    return position.left(1)
  }
} 

object arriba {
  method siguiente(position) {
    return position.up(1)
  }
}
