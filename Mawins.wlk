// PRENDAS

class Prenda{
      var precioBase
      var property estado
        
      method precioUnitario() = estado.conversion(precioBase)
}

object nueva{
      method conversion(precio) = precio
}

class Promocion{
      const descuento
      
      method conversion(precio) = precio - descuento
}

object liquidacion{
      method conversion(precio) = precio/2
}

// ITEMS

class Item{
      var prenda
      var cantidad
      
      method precioTotal() = prenda.precioUnitario() * cantidad
}

// VENTAS

class Venta{
      const items = []
      const fecha
      
      method importe() = items.sum{item => item.precioTotal()}
      method esDeFecha(f) = f == fecha
}

class Tarjeta inherits Venta{
      var cuotas
      const recargo
      
      override method importe() = cuotas * recargo + 0.01 * super() + super()
}

// SUCURSALES

class Sucursal{
      const ventas = []
      
      method recaudacionDe(fecha) = ventas.
                                    filter{venta => venta.esDeFecha(fecha)}.
                                    sum{venta => venta.importe()}
}
