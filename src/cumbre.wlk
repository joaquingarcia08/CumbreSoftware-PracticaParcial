import participantes.*
import paisesEmpresasActividades.*

object cumbre {
	const property paisesAuspiciantes = #{}
	const property participantes = #{}
	var property commitsMinimosProgramador = 300
	const property actividadesRealizadas = #{}
		
	method agregarAuspiciante(pais) {
		paisesAuspiciantes.add(pais)
	}	
	method ingresa(participante) {
		if (self.puedeEntrar(participante)) {
			participantes.add(participante)
		}
		else {
			self.error("No cumple las condiciones de ingreso")
		}
	}
	method esConflictivo(pais) {
		return pais.conflictos().any({p => p == self.paisesAuspiciantes()})
	}
	method paisesDeParticipantes() {
		return participantes.map({p => p.pais()}).asSet()
	}
	method participantesDe(pais) {
		return participantes.filter({p => p.pais() == pais}).size()
	}
	method paisConMasParticipantes() {
		return self.paisesDeParticipantes().max{pais => self.participantesDe(pais)}
	}
	method participantesExtranjeros() {
		return participantes.filter({p => p.pais() != self.paisesAuspiciantes() })
	}
	method esRelevante() {
		return participantes.all({p => p.esCapo()})
	}
	method restringirAcceso(participante) {
		if (self.participantesExtranjeros().contains(participante)) {
			return self.participantesDe(participante.pais()) >= 1 && self.esConflictivo(participante.pais())
		}
		else {
			return self.esConflictivo(participante.pais())
		}
	}
	method puedeEntrar(participante) {
		return participante.puedeEntrar() && !self.restringirAcceso(participante)
	}
	method esSegura() {
		return participantes.all({p => p.puedeEntrar()})
	}
	method realizarActividad(actividad) {
		self.actividadesRealizadas().add(actividad)
		self.participantes().forEach({p => p.hacerActividad(actividad)})
	}
	method horasDeActividades() {
		return self.actividadesRealizadas().map({a => a.cantidadDeHoras()}).sum()
	}
}
