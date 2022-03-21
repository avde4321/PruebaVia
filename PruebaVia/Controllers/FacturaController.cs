using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using PruebaVia.Interfaces;
using System;
using System.Threading.Tasks;

namespace PruebaVia.Controllers
{
    public class FacturaController : Controller
    {
        private readonly FacturaInterface _facturaInterface;
        private readonly IConfiguration _configuration;
        private string change = string.Empty;

        public FacturaController(FacturaInterface facturaInterface, IConfiguration configuration)
        {
            this._facturaInterface = facturaInterface;
            this._configuration = configuration;
        }

        public IActionResult Index()
        {
            return View();
        }

        //public async Task<IActionResult> Get_all_Factura() 
        //{
        //    try
        //    {
        //        change = _configuration.GetSection("ConnectionStrings").GetSection("Conexion").Value;
        //        var res = _facturaInterface
        //        return Ok();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
    }
}
