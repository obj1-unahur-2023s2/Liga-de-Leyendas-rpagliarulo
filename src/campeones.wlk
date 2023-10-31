import items.*
import minions.*

class Campeon {
	var puntosDeDanio
	var puntosDeVida
	var puntosDeAtaque
	const property items= []
	
	method estaVivo()= puntosDeDanio >= puntosDeVida
	method batallarContra(oleada) {puntosDeDanio += oleada.danioQueProduce()}
	method puntosDeDanio()= puntosDeDanio
	method equipar(item)= items.add(item)
	method desequipar(item)= items.remove(item)
	method puntosDeVida()= puntosDeVida + self.puntosDeVidaPorItemsEquipados()
	method puntosDeVidaPorItemsEquipados()= items.sum({item => item.puntosDeVidaQueOtorga(self)})
	method puntosDeAtaque()= puntosDeAtaque + self.puntosDeAtaquePorItemsEquipados()
	method puntosDeAtaquePorItemsEquipados()= items.sum({item => item.puntosDeAtaqueQueOtorga(self)})
	method itemConMasPuntosDeVida()= items.max({item => item.puntosDeVidaQueOtorga(self)})
	method itemConMasPuntosDeAtaqueQueDeVida() = items.filter({item => item.puntosDeVidaQueOtorga(self) < item.puntosDeAtaqueQueOtorga(self)})
	method hayItemConMasDe70DeVidaO30DeAtaque()= items.any({item => item.tieneMasDe70DeVida(self)}) or items.any({item => item.tieneMasDe30DeAtaque(self)})
	method listaDePesosDeCadaItem()= items.map({item => item.peso()})
	method cantidadItemsQuePesanMenosDe300()= items.count({item => item.peso() < 300})
}


