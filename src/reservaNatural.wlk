import especies.*

object reserva {
	const habitats = []
	method habitatConMayorBiomasa() = habitats.max({c => c.biomasaTotal()})
	method biomasaTotalRes() = habitats.sum({c => c.biomasaTotal()})
	method habitatsDesequilibrados()= habitats.filter({c => not c.estaEnEquilibrio()})
	
	
	method especieEnTodosLosHabitats(especie)= habitats.all({c => c.any({c.especie() == especie})})
	

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
}