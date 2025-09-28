import pepita.*

//---------------------------   NIDO   ---------------------------------

object nido {
  method image() = "nido.png"
	method position() = game.center()

  method colisionarCon(objeto) {
    if (pepita.comidas() == 0 ){ 
      game.say(objeto,"¡GANE!")
      //game.tick(2000, game.stop() , false)
      game.removeTickEvent("caer")
       game.onTick(2000, "parar juego", {game.stop()})
    }else{
      game.say(objeto,"Todavia faltan comer")
    }
  
}

}


//---------------------------   SILVESTRE   ---------------------------------
/// 
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
   method colisionarCon(objeto) {
    game.say(objeto,"¡PERDÍ!")
    //game.onTick(2000, "Perder" , {game.stop()})		
    game.tick(2000, { game.stop() }, false)
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



//----------------------------   MURO    --------------------------------

object  muro{
  var property position = game.at(5, 7)
	method image() {return "muro.png"}
	
	//method encontroCon(cosa) {
	//	game.removeTickEvent("caer")
	//}
  method colisonarCon(objeto) {
    game.say(objeto,"Es un muro!")
	
  }
}


object  muro2{
  var property position = game.at(5, 3)
	method image() {return "muro.png"}
	
	//method encontroCon(cosa) {
	///	game.removeTickEvent("caer")
	//}
   method colisionarCon(objeto) {
    	//pepita.comer(self)
		  game.say(objeto,"Es un muro!")
	
  }
}



