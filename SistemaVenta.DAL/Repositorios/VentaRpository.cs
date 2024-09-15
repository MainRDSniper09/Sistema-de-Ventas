using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SistemaVenta.DAL.DBContext; // Hacemos algunas referencias
using SistemaVenta.DAL.Repositorios.Contrato;
using SistemaVenta.Model;

namespace SistemaVenta.DAL.Repositorios
{
    public class VentaRpository : GenericRepository<Venta>, IVentaRepository
    {
        private readonly DbventaContext _dbContext;

        public VentaRpository(DbventaContext dbContext) : base(dbContext)
        {
            {
                _dbContext = dbContext;
            }

        }

        public async Task<Venta> Registrar(Venta modelo)
        {
            Venta ventaGenerada = new Venta();

            using (var transaction = _dbContext.Database.BeginTransaction())
            {
                try {
                    // Restar el stock de cada producto
                    // Logica para los productos dentro de la venta
                    foreach (DetalleVenta dv in modelo.DetalleVenta) { 
                        
                        Producto producto_encontrado = _dbContext.Productos.Where(p => p.IdProducto == dv.IdProducto).First();

                        producto_encontrado.Stock = producto_encontrado.Stock - dv.Cantidad;
                        _dbContext.Productos.Update(producto_encontrado); // Actualiza el nuevo stock
                    }
                    await _dbContext.SaveChangesAsync(); // Guardamos los cambios de manera 

                    NumeroDocumento correlativo = _dbContext.NumeroDocumentos.First();

                    correlativo.UltimoNumero = correlativo.UltimoNumero + 1; // Para que no empiece en 0 Hacemos que empiece en 1
                    correlativo.FechaRegistro = DateTime.Now; // Agregamos la fecha de registro

                    _dbContext.NumeroDocumentos.Update(correlativo); // Actualizamos los cambios
                    await _dbContext.SaveChangesAsync(); // Guardamos los cambios

                    // Generar el formato del numero de documento de venta
                    int CantidadDigitos = 4;
                    String ceros = String.Concat(Enumerable.Repeat("0", CantidadDigitos));
                    String numeroVenta = ceros + correlativo.UltimoNumero.ToString();
                    //0001 Este es el formato que estamos creando

                    numeroVenta = numeroVenta.Substring(numeroVenta.Length - CantidadDigitos, CantidadDigitos);
                    
                    modelo.NumeroDocumento = numeroVenta;

                    await _dbContext.Venta.AddAsync(modelo);
                    await _dbContext.SaveChangesAsync();

                    ventaGenerada = modelo;

                    transaction.Commit(); // Nuestra transaccion pueda finalizar sin ningun problema

                } catch { 
                
                    transaction.Rollback(); // Para que pueda restablecer todo, en caso de encontrar un error
                    throw;                    
                }

                return ventaGenerada;
            }
        }
    }
}

