import conocimientos.*
import cumbre.*

class Participante {
	var property pais
	const conocimientos = []
	var commits
	
	method agregarConocimiento(conocimiento) {conocimientos.add(conocimiento)}
	method esCape()
	
	//alternativa con super
	method puedeEntrar() = conocimientos.contains(programacionBasica)

	method condicionBasica() = conocimientos.contains(programacionBasica)
	method condicionAdicional()
	
	//alternativa sin super
	method puedeEntrar2() = self.condicionBasica() && self.condicionAdicional()
}

class Programador inherits Participante{
	override method esCape() = commits > 500
	override method puedeEntrar() = super() && commits >= cumbre.commitsMinimosProgramador()
	override method condicionAdicional() = commits >= cumbre.commitsMinimosProgramador()
}

class Especialista inherits Participante{
	override method esCape() = conocimientos.size() > 2
	override method puedeEntrar() = super() && commits >= cumbre.commitsMinimosProgramador() - 100 && conocimientos.contains(objetos)
	override method condicionAdicional() = commits >= cumbre.commitsMinimosProgramador() - 100 && conocimientos.contains(objetos)
}


class Empresa {

}