import cumbre.*
class Pais {
	var property conflictos = #{}
	
	method registrarConflictoCon(pais) {
		pais.conflictos().add(self)
		self.conflictos().add(pais)
	}
}


class Actividades {
	var property tema
	var property cantidadDeHoras
		
}
