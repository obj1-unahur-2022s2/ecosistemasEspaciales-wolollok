import especies.*

object reserva {
	const habitats = []
	method habitatConMayorBiomasa() = habitats.max({c => c.biomasaTotal()})
	method biomasaTotalRes() = habitats.sum({c => c.biomasaTotal()})
	method habitatsDesequilibrados()= habitats.filter({c => not c.estaEnEquilibrio()})
	method agregarHabitat(habitat){habitats.add(habitat)}
	
	method especieEnTodosLosHabitats(especie)= habitats.all({c => c.hayDeLaEspecie(especie)})
	method especieEnUnHabitat(especie)= habitats.any({c => c.hayDeLaEspecie(especie)})

}

class Habitat {
	const seresVivos = []
	method biomasaTotal() = seresVivos.sum({c => c.biomasa()})
	method estaEnEquilibrio() = seresVivos.count({c => c.esGrande()}) < seresVivos.count({c=>c.esPequenio()})/3 and seresVivos.any({c=>c.esMediano()})
	method incendiar(){
		seresVivos.removeAll(seresVivos.filter({c => c.estaMuerto()}))
		seresVivos.forEach({c => c.sufrirIncendio()})
	}
	// method animalesQueMueren()= seresVivos.filter({c => c.muere()})
	method hayDeLaEspecie(especie)= seresVivos.any({c => c.especie() == especie})
	method seresVivos()= seresVivos
}