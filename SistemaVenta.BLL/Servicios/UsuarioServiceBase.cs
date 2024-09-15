using Microsoft.EntityFrameworkCore;
using SistemaVenta.DTO;
using SistemaVenta.Model;

namespace SistemaVenta.BLL.Servicios
{
    public class UsuarioServiceBase
    {

        public async Task<SesionDTO> ValidarCredenciales(string correo, string clave)
        {
            try
            {
                var queryUsuario = await _usuarioRepositorio.Consultar(u => u.Correo == correo && u.Clave == clave);

                if (queryUsuario.FirstOrDefault() == null)
                {
                    throw new TaskCanceledException("El usuario no existe");

                    Usuario devolverUsuario = queryUsuario.Include(rol => rol.IdRolNavigation).First();
                    return _mapper.Map<SesionDTO>(devolverUsuario);
                }
            }
            catch
            {
                throw;
            }
        }
    }
}