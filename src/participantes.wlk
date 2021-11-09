import conocimientos.*
import cumbre.*


class Participante {
	var property pais
	var property conocimientos
	var property commits
	method esCapo()
	method puedeEntrar() {
		return conocimientos.contains({programacionBasica})
	}
	method hacerActividad(actividad) {
		self.conocimientos().add(actividad.tema())
		commits += (actividad.cantidadDeHoras() * actividad.tema().commitsPorHora())
	}
}
class Programadores inherits Participante {
	var property horasDeCapacitacion = 0
	override method esCapo() {
		return commits > 500
	}
	override method puedeEntrar() {
		return super() && self.commits() > cumbre.commitsMinimosProgramador()
	}
	override method hacerActividad(actividad) {
		super(actividad)
		horasDeCapacitacion += actividad.cantidadDeHoras()
	}
}
class Especialistas inherits Participante {
	override method esCapo() {
		return conocimientos.size() > 2
	}
	override method puedeEntrar() {
		return super() && self.commits() > (cumbre.commitsMinimosProgramador() - 100) && self.conocimientos().contains({objetos})
	}
}

class Gerentes inherits Participante {
	var property empresa
	override method esCapo() {
		return self.empresa().esInternacional()
	}
	override method puedeEntrar() {
		return super() && self.conocimientos().contains(manejoDeGrupos)
	}
}

class Empresa {
	var property paisesEstablecidos
	method esInternacional() {
		return self.paisesEstablecidos() > 3
	}
}