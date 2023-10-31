import campeones.*

class Item {
	const property peso
	
	method puntosDeVidaQueOtorga(campeon)= if (peso <= 500) {20} else {40}
	method puntosDeAtaqueQueOtorga(campeon)= if (peso <= 500) {10} else {5}
	method tieneMasDe70DeVida(campeon)= self.puntosDeVidaQueOtorga(campeon) > 70
	method tieneMasDe30DeAtaque(campeon)= self.puntosDeAtaqueQueOtorga(campeon) > 30 
}

class AnilloDeDoran inherits Item {
	
	override method puntosDeVidaQueOtorga(campeon)= 60 + super(campeon)
	override method puntosDeAtaqueQueOtorga(campeon)= 15 + super(campeon)
}

class TomoAmplificador inherits Item {
	
	override method puntosDeVidaQueOtorga(campeon)= super(campeon) + campeon.puntosDeDanio() * 0.25
	override method puntosDeAtaqueQueOtorga(campeon)= super(campeon) +  campeon.puntosDeDanio() * 0.10
}

class SombreroDeRabadon inherits TomoAmplificador {
	
	override method puntosDeVidaQueOtorga(campeon)= super(campeon) * 2
	override method puntosDeAtaqueQueOtorga(campeon)= super(campeon) + 2
}

