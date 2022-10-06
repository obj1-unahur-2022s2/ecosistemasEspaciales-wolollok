class EspecieFauna { // tipo de animal (ave/puma/mono)
	const property pesoReferencia
	// agregar las propiedades necesarias
	const property locomocion
}

class EspecieFlora {
	 //nunca supera el limite. 10 es la altura limite con la q se considera GRANDE/PEQUEÑA
	const property alturaReferencia  // nunca es mas que este valor
	
}

class Animal {
	var property peso
	const property especie
	const biomasa = (peso*peso)/especie.pesoReferencia()
	method biomasa()= biomasa
	method esGrande()= self.peso() > especie.pesoReferencia()*2
	method esPequenio()= self.peso() < especie.pesoReferencia()/2
	method esMediano()= not (self.esPequenio() or self.esGrande())
	//method muere()= especie.locomocion().seSalva(self)
	method estaMuerto()= not especie.locomocion().seSalva(self)
	method sufrirIncendio(){ peso -= peso*0.1}
}

class Planta {
	const property especie
	var altura 
	var property biomasa = self.altura()*2 
	method altura()= if(altura < especie.alturaReferencia()) altura else especie.alturaReferencia()
	method altura(a) {altura = a.min(especie.alturaReferencia())}
	method esPequenio()= self.altura() < 10
	method esGrande()= self.altura() >= 10
	method esMediano()= false
	method estaMuerto()= self.esPequenio()
	method sufrirIncendio(){
		if(self.esGrande()){
			if(altura < especie.alturaReferencia()){
				altura -= 5
			}
			else{
				altura = especie.alturaReferencia() - 5
			} 
		}
	}
}


object volar {method seSalva(animal) = animal.esGrande()}
object nadar {method seSalva(animal) = true}
object correr {method seSalva(animal) = animal.esMediano()}
object quedarseQuieto {method seSalva(animal) = false}






