using PruebaVia.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PruebaVia.Interfaces
{
    public interface ProductoInterface
    {
        Task<List<tblProducto>> Get_Produto(string change, tblProductoQuery parameter);
    }
}
