object pepita {
  var energy = 100

  method energy() = energy

  method fly(minutes) {
    energy = energy - minutes * 3
  }
}

object casa{
    var suciedad = 1000
   
  method suciedad(nuevoValor) {
    suciedad = nuevoValor
    }
  method suciedad() = suciedad
  method cuidador() = tom

  method atrapar(quilombero) = if(self.cuidador().puedeAtrapar(quilombero)) {pandilla.quilomberos().remove(quilombero)}

}

object pandilla{
  var property quilomberos = [jerry, tuffy]
  var velocidad = 10
  method velocidad(){ 
    velocidad = self.masLento() / 2
    return velocidad
  }

  method masLento() = self.quilomberos().map({unQuilombero => unQuilombero.velocidad()}).min()
  
}

object tom{
    var energia = 500
    var velocidad = 30

    method velocidad(){
      velocidad = 5 + (energia / 10)
      return velocidad
    } 

    method limpiarLaCasa(casa){
        casa.suciedad(casa.suciedad() - 100)
        energia -= 40
    }

    method dormir(){
        energia += 50
    }

    method puedeAtrapar(quilombero) = (quilombero.velocidad() < self.velocidad())

    method despertar(){
      energia -= 20
    }
}

object jerry{
    var peso = 5
    var velocidad = 10

    method hacerQuilombo(casa){
        casa.suciedad(casa.suciedad() + 110)
        self.robarComida()
    }

    method robarComida(){
        peso += 1
    }

    method velocidad(){
      velocidad = 10 - peso
      return velocidad
  }
}

object tuffy{
    var velocidad = 10

    method hacerQuilombo(casa){
      casa.cuidador().despertar()
    }
}

object robocat{
  method limpiarLaCasa(casa){
    casa.suciedad(0)
  }

  method puedeAtrapar(quilombero) = true

}
