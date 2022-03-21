using PruebaVia.Interfaces;
using PruebaVia.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace PruebaVia.services
{
    public class ProductoService : ProductoInterface
    {

        public async Task<List<tblProducto>> Get_Produto(string change, tblProductoQuery parameter)
        {
            List<tblProducto> listProducto = new List<tblProducto>();
            using (SqlConnection connection = new(change))
            {

                try
                {

                    connection.Open();
                    using (SqlCommand command = new("[sp_consulta_producto]", connection))
                    {
                        command.Parameters.Add(new SqlParameter("@id_produto", SqlDbType.VarChar, 100)).Value = parameter.id_produto;
                        command.Parameters.Add(new SqlParameter("@cod_producto", SqlDbType.VarChar, 100)).Value = parameter.cod_producto;
                        command.Parameters.Add(new SqlParameter("@estado", SqlDbType.VarChar, 100)).Value = parameter.estado;

                        command.CommandType = CommandType.StoredProcedure;
                        command.ExecuteNonQuery();
                        command.CommandTimeout = 0;

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (await reader.ReadAsync())
                            {
                                listProducto.Add(new tblProducto()
                                { 
                                    id_produto = reader["id_produto"].ToString().Trim().ToUpper(),
                                    cod_producto = reader["cod_producto"].ToString().Trim().ToUpper(),
                                    descripcion = reader["descripcion"].ToString().Trim().ToUpper(),
                                    precioUnitario = reader["precioUnitario"].ToString().Trim().ToUpper(),
                                    estado = reader["estado"].ToString().Trim().ToUpper(),
                                    fechaCreacion = reader["fechaCreacion"].ToString().Trim().ToUpper(),
                                });
                            }
                        }
                    }
                }
                catch (Exception ex)
                {

                    throw;
                }
                finally
                {
                    connection.Close();
                }
            }
            return listProducto;
        }

    }
}
