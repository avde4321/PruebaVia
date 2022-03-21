using System.Collections.Generic;

namespace PruebaVia.Models
{
    public class ListFactura
    {
        public List<Factura> facturas { get; set; } 
    }
    public class Factura
    {
        public string id_factrua { get; set; }
        public string id_compania { get; set; }
        public string id_vendedor { get; set; }
        public string establecimiento { get; set; }
        public string puntoEmision { get; set; }
        public string sucursal { get; set; }
        public string fechaIngreso { get; set; }
        public string nombreCliente { get; set; }
        public string direccionCliente { get; set; }
        public string correoCliente { get; set; }
        public string valorTotal { get; set; }
        public string estado { get; set; }
        public string fechaCreacion { get; set; }

        public List<tblfacturadet> detalle { get; set; }

    }
    public class tblfacturadet
    {
        public string id_factruaDet { get; set; }
        public string id_factrua { get; set; }
        public string cod_produto { get; set; }
        public string descripcion { get; set; }
        public string valorUnitario { get; set; }
        public string estado { get; set; }
        public string fechaCreacion { get; set; }

    }
}
