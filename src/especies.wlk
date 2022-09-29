class EspecieFauna { // tipo de animal (ave/puma/mono)
	const property pesoReferencia
	// agregar las propiedades necesarias
	const property locomocion
}

class EspecieFlora {
	const alturaMaxima = 10 //nunca supera el limite. 10 es la altura limite con la q se considera GRANDE/PEQUEÑA
	method alturaMaxima()= alturaMaxima
}

class Animal {
	var property peso
	const property especie
	const biomasa = (peso*peso)/especie.pesoReferencia()
	method biomasa()= biomasa
	method esGrande()= self.peso() > self.peso()*2
	method esPequenio()= self.peso() < self.peso()/2
	method esMediano()= not (self.esPequenio() or self.esGrande())
	//method muere()= especie.locomocion().seSalva(self)
	method estaMuerto()= not especie.locomocion().seSalva(self)
	method sufrirIncendio(){ peso -= peso*0.1}
}

class Planta {
	var property altura
	var property biomasa = altura*2 
	const property especie
	method esPequenio()= self.altura() < especie.alturaMaxima()
	method esGrande()= not self.esPequenio()
	method esMediano()= not (self.esPequenio() or self.esGrande())
	method estaMuerto()= self.esPequenio()
	method sufrirIncendio(){if(self.esGrande()){altura -= 5}}
}


object volar {method seSalva(animal) = animal.esGrande()}
object nadar {method seSalva(_) = true}
object correr {method seSalva(animal) = animal.esMediano()}
object quedarseQuieto {method seSalva(_) = false}






