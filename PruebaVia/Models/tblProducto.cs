namespace PruebaVia.Models
{
    public class tblProducto
    {
        public string id_produto{get; set; }
        public string cod_producto{get; set; }
        public string descripcion{get; set; }
        public string precioUnitario{get; set; }
        public string estado{get; set; }
        public string fechaCreacion { get; set; }

    }

    public class tblProductoQuery
    {
        public string id_produto { get; set; }
        public string cod_producto { get; set; }
        public string estado { get; set; }

    }
}
