object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var auto = false

    method cambiarAAuto(){
        auto = true 
    }

    method peso() = 800

    method peligrosidad(){
        return if(auto) 15 else 30
    } 
  
}


object paqueteLadrillos {
    var property cantLadrillos = 1 
    method peso() {
        return cantLadrillos * 2
    }
    method peligrosidad() = 2 
}

object arenaGranel {
    var peso = 1

    method cambiarPeso(unPeso){
       peso = unPeso
    }
    
    method peso() = peso 

    method peligrosidad() = 1
}

object bateriaAntiaerea {

    var tieneMisiles = false

    method cargarMisiles(){
        tieneMisiles = true
    }

    method peso() = if(tieneMisiles) 300 else 200

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

}



object residuos {
    var peso = 1 
    method cambiarPeso(otroPeso){
        peso = otroPeso
    }
    method peso() = peso
    method peligrosidad() = 0   
}

object embalajeSeguridad {
    var property unaCosa = contenedorPortuario

    method peso(){
        return unaCosa.peso()
    }

    method peligrosidad(){
        return unaCosa.peligrosidad() / 2
    }
}

