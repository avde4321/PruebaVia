using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using PruebaVia.Interfaces;
using PruebaVia.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaVia.Controllers
{
    public class ProductoController : Controller
    {
        private readonly ProductoInterface _productoInterface;
        private readonly FacturaInterface _facturaInterface;
        private readonly IConfiguration _configuration;
        private string change = string.Empty;

        public ProductoController(ProductoInterface productoInterface, IConfiguration configuration, FacturaInterface facturaInterface)
        {
            this._productoInterface = productoInterface;
            this._configuration = configuration;
            this._facturaInterface = facturaInterface;
        }
        public IActionResult Index()
        {
            List<tblProducto> listPro = new List<tblProducto>();
            listPro = Get_Producto(null).GetAwaiter().GetResult();

            ViewData["ListaProducto"] = listPro;
            return View();
        }

        [HttpGet("Get_Producto")]
        public async Task<List<tblProducto>> Get_Producto([FromQuery] tblProductoQuery paraneter)
        {
            List<tblProducto> listddp = new List<tblProducto>();
            tblProductoQuery tblProductoQuery = new tblProductoQuery();
            try
            {
                change = _configuration.GetSection("ConnectionStrings").GetSection("Conexion").Value;
                listddp = _productoInterface.Get_Produto(change, tblProductoQuery).GetAwaiter().GetResult();
                
            }
            catch (Exception)
            {
                throw;
            }
            return listddp;
        }

        [HttpPost("Post_Factrua")]
        public async Task<IActionResult> Post_Factrua([FromBody] ListFactura factura)
        {
            Response response = new Response();
            
            try
            {
                change = _configuration.GetSection("ConnectionStrings").GetSection("Conexion").Value;

                for (var i = 0; i< factura.facturas.Count;i++)
                {
                    tblFacturaCab tblFacturaCab = new tblFacturaCab();
                    tblFacturaCab.id_factrua = factura.facturas[i].id_factrua;
                    tblFacturaCab.id_compania = factura.facturas[i].id_compania;
                    tblFacturaCab.id_vendedor = factura.facturas[i].id_vendedor;
                    tblFacturaCab.establecimiento = factura.facturas[i].establecimiento;
                    tblFacturaCab.puntoEmision = factura.facturas[i].puntoEmision;
                    tblFacturaCab.sucursal = factura.facturas[i].sucursal;
                    tblFacturaCab.fechaIngreso = factura.facturas[i].fechaIngreso;
                    tblFacturaCab.nombreCliente = factura.facturas[i].nombreCliente;
                    tblFacturaCab.direccionCliente = factura.facturas[i].direccionCliente;
                    tblFacturaCab.correoCliente = factura.facturas[i].correoCliente;
                    tblFacturaCab.valorTotal = factura.facturas[i].valorTotal;
                    tblFacturaCab.estado = factura.facturas[i].estado;
                    tblFacturaCab.fechaCreacion = factura.facturas[i].fechaCreacion;

                    _facturaInterface.Post_FacturaCab(change, tblFacturaCab).GetAwaiter().GetResult();

                    for (var j = 0; j < factura.facturas[i].detalle.Count();j++)
                    {
                        tblFacturaDet tblFacturaDet = new tblFacturaDet();
                        tblFacturaDet.id_factruaDet = factura.facturas[i].detalle[j].id_factruaDet;
                        tblFacturaDet.id_factrua = factura.facturas[i].detalle[j].id_factrua;
                        tblFacturaDet.cod_produto = factura.facturas[i].detalle[j].cod_produto;
                        tblFacturaDet.descripcion = factura.facturas[i].detalle[j].descripcion;
                        tblFacturaDet.valorUnitario = factura.facturas[i].detalle[j].valorUnitario;
                        tblFacturaDet.estado = factura.facturas[i].detalle[j].estado;
                        tblFacturaDet.fechaCreacion = factura.facturas[i].detalle[j].fechaCreacion;

                        _facturaInterface.Post_FactruDet(change, tblFacturaDet).GetAwaiter().GetResult();
                    }
                }

                return Ok(response);
            }
            catch (Exception ex)
            {

                throw;
            }
        }

    }
}
