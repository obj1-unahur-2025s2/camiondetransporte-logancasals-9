import cosas.*
object camion {
    
    const cargas = []
    method cargar(unaCosa) {
        cargas.add(unaCosa)
    }
    method descargar(unaCosa){
        cargas.remove(unaCosa)
    }
    
    method pesoTotal() = 1000 + cargas.sum({c => c.peso()})

    method cargasPares(){
        return cargas.all({c => c.peso().even()})
    }

    method cosaConDeterminadoValor(unValor){
        return cargas.any({c => c.peso() == unValor})
    }

    method primeraCosaConPeligrosidad(peligrosidad){
        return cargas.filter({c => c.peligrosidad() == peligrosidad}).first()
    }

    method cosasQueSuperanPeligrosidad_(peligrosidad){
        return cargas.filter({c => c.peligrosidad() > peligrosidad})
    }

    method cosaDadaQueSuperarPeligrosidad(unaCosa){
        return cargas.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
    }

    method superaPesoMaximo(){
        return self.pesoTotal() > 2500
    }

    method puedeCircularEnRuta(peligrosidad){
        return not self.superaPesoMaximo() && self.cosaDadaQueSuperarPeligrosidad(peligrosidad).isEmpty()
    }

    method pesoEntre(valorMin,valorMax){
        return cargas.any({c => c.peso().between(valorMin, valorMax)})
    }

    method cosaMasPesada(){
        return cargas.max({c => c.peso()})
    }
}