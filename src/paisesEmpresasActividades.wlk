import cumbre.*
class Pais {
	const conflictivos = []
	
	method tieneConflictoCon(pais) = conflictivos.contains(pais)
	
	method registrarConflicto(pais) {
		conflictivos.add(pais)
	}
//	method esConflictivo() = cumbre.esConflictivo(self)
	
}


class Actividad {
}