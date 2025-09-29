object knightRider{
    method peso() = 500
    method peligrosidad() = 10
    method bulto() = 1
    method reaccion() {}
}

object bumblebee {
    var auto = false
    method cambiarAAuto(){
        auto = true 
    }

    method cambiarARobot() {
      auto = false
    }
    method peso() = 800

    method peligrosidad(){
        return if(auto) 15 else 30
    } 
    method bulto() = 2

    method reaccion() {
       self.cambiarARobot()
    }
  
}


object paqueteLadrillos{
    var property cantLadrillos = 1 

    method peso() {
        return cantLadrillos * 2
    }
    method peligrosidad() = 2 
    method bulto(){
        var ladrillos = 0
        if (cantLadrillos < 100 ){
            ladrillos = 1
        }
        else if(cantLadrillos.between(101, 300)){
            ladrillos = 2
        }
        else {
            ladrillos = 3
        }
        return ladrillos
    }
    method reaccion(){
        self.cantLadrillos(cantLadrillos+12)
    }
}

object arenaGranel {
    var peso = 1
    method cambiarPeso(unPeso){
       peso = unPeso
    }
    method peso() = peso 
    method peligrosidad() = 1
    method bulto() = 1
    method reaccion(){
        self.peso() - 10
    }

}

object bateriaAntiaerea {

    var tieneMisiles = false

    method cargarMisiles(){
        tieneMisiles = true
    }

    method peso() = if(tieneMisiles) 300 else 200

    method bulto() {
        return if(!tieneMisiles) 1 else 2 
    }

    method reaccion(){
        self.cargarMisiles()
    }

}

object contenedorPortuario {

    const property contenido = []

    method agregarCosa(unaCosa){
        contenido.add(unaCosa)
    }

    method sacarCosa(unaCosa){
        contenido.remove(unaCosa)
    }


    method peso(){
        return 100 + contenido.sum({c => c.peso()})
    }

    method peligrosidad(){
        return if(contenido.isEmpty()) 0 else contenido.max({c => c.peligrosidad()}).peligrosidad() 
    }

    method bulto(){
        return 1 + contenido.sum({c => c.bulto()})
    }

    method reaccion(){
        contenido.forEach({c => c.reaccion()})
    }
}



object residuos {
    var peso = 1 
    method cambiarPeso(otroPeso){
        peso = otroPeso
    }
    method peso() = peso
    method peligrosidad() = 0   
    method bulto() = 1
    method reaccion(){
        self.cambiarPeso(15)
    }
}

object embalajeSeguridad {
    var property unaCosa = contenedorPortuario

    method peso(){
        return unaCosa.peso()
    }

    method peligrosidad(){
        return unaCosa.peligrosidad() / 2
    }
    method bulto() = 2

    method reaccion(){}
}



