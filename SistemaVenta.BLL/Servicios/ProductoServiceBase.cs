namespace SistemaVenta.BLL.Servicios
{
    public class ProductoServiceBase
    {

        public async Task<bool> Eliminar(int id)
        {
            try
            {
                var productoEncontrado = await _productoRepositorio.Obtener(p => p.IdProducto == id);

                if (productoEncontrado == null)
                    throw new TaskCanceledException("El producto no existe");

                bool respuesta = await _productoRepositorio.Eliminar(productoEncontrado);

                if (!respuesta)
                    throw new TaskCanceledException("No se pudo eliminar");

                return respuesta;
            }
            catch
            {

            }
        }
    }
}