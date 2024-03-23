//Empleados

/*Modificar el comportamiento de Galván para que maneje sus gastos, el dinero que tiene, y su deuda. 
 * Cuando Galván gasta, se descuenta de su dinero, si no le alcanza aumenta la deuda. Cuando cobra un sueldo, 
 Galván paga sus deudas. Si sobra algo, se suma al dinero que tiene. 
 Agregar a Galván la capacidad de entender los mensajes: `gastar(cuanto)`, `totalDeuda()`, `totalDinero()`.*/

object galvan{
	var sueldo = 15000 //var property sueldo = 15000
	var dinero = 0
	
	method sueldo(){
		return sueldo
	}
	
	method sueldo(_sueldo){
		sueldo = _sueldo
	}
	
	method cobrarSueldo(){
		dinero +=sueldo
	}
	
	method gastar(monto){
		dinero -= monto
	}
	
	method tieneDeuda(){
		return dinero < 0
	}
	
	method totalDeuda(){
		return if (self.tieneDeuda()) dinero * -1 else 0	
		//return if (self.tieneDeuda()) dinero.abs() else 0	
	}
	
	method totalDinero(){
		return if (self.tieneDeuda()) 0 else dinero
	}
}

object baigorria{
	var precioEmpanada = 15
	var empanadasVendidas = 0
	var totalCobrado = 0
	
	method venderEmpanadas(cantidad){
		empanadasVendidas += cantidad 
	}
	
	method precioEmpanada(_precioEmpanada){
		precioEmpanada = _precioEmpanada 
	}
	
	method sueldo(){
		return precioEmpanada * empanadasVendidas
	}
	
	method cobrarSueldo(){
	 	totalCobrado += self.sueldo()
	 	empanadasVendidas = 0	
	}	
	
	method totalCobrado(){
		return totalCobrado
	}
}

//Dueño
object gimenez{
	var fondo = 300000
	
	method pagarA(empleado){
		fondo -= empleado.sueldo()	
		empleado.cobrarSueldo()
	}
	
	method fondo(){
		return fondo
	}	
}

/*
  Baigorria cuando cobra el sueldo lo suma a un acumulador de todo lo que cobró, agregarle la capacidad de entender el mensaje `totalCobrado()`. Galván no hace nada.
* */
