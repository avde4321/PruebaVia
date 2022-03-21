using PruebaVia.Models;
using System.Threading.Tasks;

namespace PruebaVia.Interfaces
{
    public interface FacturaInterface
    {
        Task<Response> Post_FacturaCab(string change, tblFacturaCab parameter);
        Task<Response> Post_FactruDet(string change, tblFacturaDet parameter);
    }
}
