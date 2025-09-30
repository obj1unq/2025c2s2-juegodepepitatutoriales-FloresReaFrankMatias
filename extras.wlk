import pepita.*

//---------------------------   NIDO   ---------------------------------

object nido {
  method image() = "nido.png"
	method position() = game.center()

  method colisionarConPepita() {
    pepita.ganar()
    //if (pepita.comidas() == 0 ){ 
      //game.say(pepita,"¡GANE!")
      //game.tick(2000, game.stop() , false)
      //game.removeTickEvent("caer")
       //game.onTick(2000, "parar juego", {game.stop()})
     //  pepita.ganar()
    //}else{
     // game.say(pepita,"Todavia faltan comer")
    //}
  
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
   method colisionarConPepita() {
    pepita.perder()
    //game.say(pepita,"¡PERDÍ!")
    //game.onTick(2000, "Perder" , {game.stop()})		
    //game.tick(2000, { game.stop() }, false)
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
  method colisionarConPepita() {
    game.say(pepita,"Es un muro!")
	
  }
}


object  muro2{
  var property position = game.at(5, 3)
	method image() {return "muro.png"}
	
	//method encontroCon(cosa) {
	///	game.removeTickEvent("caer")
	//}
   method colisionarConPepita() {
    	//pepita.comer(self)
		  game.say(pepita,"Es un muro!")
	
  }
}



