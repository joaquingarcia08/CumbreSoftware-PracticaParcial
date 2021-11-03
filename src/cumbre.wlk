object cumbre {
	const property participantes = #{}
	var property commitsMinimosProgramador = 300
	const property actividadesRealizadas = #{}
	const auspiciantes = []
	const registrados = []

	
	method registrar(persona) {
		registrados.add(persona)
	}
	
	method agregarAuspiciante(pais) {
		auspiciantes.add(pais)
	}

	method ingresa(unParticipante) {
		participantes.add(unParticipante)
	}
	method esConflictivo(pais) = auspiciantes.any{aus=>aus.tieneConflictoCon(pais)}
	
	method cantidadDeParticipantesDe(pais) = participantes.count{p=> p.pais() == pais}
	
	method paisConMasParticipantes() = self.paises().max{pais=> self.cantidadDeParticipantesDe(pais)}
	
	method paises() = participantes.map{p=>p.pais()}.asSet()
	
	method relevante() = participantes.all{p=>p.esCape()}
	
	method participantesExtranjeros() = participantes.filter{p=>!auspiciantes.contains(p.pais())}
	
	method dejaEntrar(persona) = persona.puedeEntrar() && !self.esConflictivo(persona.pais()) && self.hayCupo(persona.pais())
	
	method hayCupo(pais) = auspiciantes.contains(pais) || self.cantidadDeParticipantesDe(pais) <= 2
	
	method darIngresoA(persona) {
		if (self.dejaEntrar(persona))
			self.ingresa(persona)
		else
			self.error("No se le permite ingresar")
//			throw new Exception(message = "No se le permite ingresar")
	}
	
	
	method esSegura() = registrados.all{p=>self.dejaEntrar(p)}
}
