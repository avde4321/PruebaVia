using PruebaVia.Interfaces;
using PruebaVia.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace PruebaVia.services
{
    public class FacturaServices : FacturaInterface
    {
        public async Task<Response> Post_FacturaCab(string change, tblFacturaCab parameter)
        {
            Response response = new Response();

            using (SqlConnection connection = new(change))
            {
                try
                {
                    connection.Open();
                    using (SqlCommand command = new("[sp_consulta_producto]", connection))
                    {
                        command.Parameters.Add(new SqlParameter("@id_factrua", SqlDbType.VarChar, 100)).Value = parameter.id_factrua;
                        command.Parameters.Add(new SqlParameter("@id_compania", SqlDbType.VarChar, 100)).Value = parameter.id_compania;
                        command.Parameters.Add(new SqlParameter("@id_vendedor", SqlDbType.VarChar, 100)).Value = parameter.id_vendedor;
                        command.Parameters.Add(new SqlParameter("@establecimiento", SqlDbType.VarChar, 100)).Value = parameter.establecimiento;
                        command.Parameters.Add(new SqlParameter("@puntoEmision", SqlDbType.VarChar, 100)).Value = parameter.puntoEmision;
                        command.Parameters.Add(new SqlParameter("@sucursal", SqlDbType.VarChar, 100)).Value = parameter.sucursal;
                        command.Parameters.Add(new SqlParameter("@fechaIngreso", SqlDbType.VarChar, 100)).Value = parameter.fechaIngreso;
                        command.Parameters.Add(new SqlParameter("@nombreCliente", SqlDbType.VarChar, 100)).Value = parameter.nombreCliente;
                        command.Parameters.Add(new SqlParameter("@direccionCliente", SqlDbType.VarChar, 100)).Value = parameter.direccionCliente;
                        command.Parameters.Add(new SqlParameter("@correoCliente", SqlDbType.VarChar, 100)).Value = parameter.correoCliente;
                        command.Parameters.Add(new SqlParameter("@valorTotal", SqlDbType.VarChar, 100)).Value = parameter.valorTotal;
                        command.Parameters.Add(new SqlParameter("@estado", SqlDbType.VarChar, 100)).Value = parameter.estado;
                        command.Parameters.Add(new SqlParameter("@fechaCreacion", SqlDbType.VarChar, 100)).Value = parameter.fechaCreacion;

                        command.CommandType = CommandType.StoredProcedure;
                        command.ExecuteNonQuery();
                        command.CommandTimeout = 0;

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (await reader.ReadAsync())
                            {
                                response = new Response()
                                {
                                    Cod = reader["cod_error"].ToString(),
                                    Messeng = reader["message"].ToString(),
                                    Data = "SI incertor",
                                };
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
            return response;
        }

        public async Task<Response> Post_FactruDet(string change, tblFacturaDet parameter)
        {
            Response response = new Response();

            using (SqlConnection connection = new(change))
            {
                try
                {
                    connection.Open();
                    using (SqlCommand command = new("[sp_consulta_producto]", connection))
                    {
                        command.Parameters.Add(new SqlParameter("@id_factruaDet", SqlDbType.VarChar, 100)).Value = parameter.id_factruaDet;
                        command.Parameters.Add(new SqlParameter("@id_factrua", SqlDbType.VarChar, 100)).Value = parameter.id_factrua;
                        command.Parameters.Add(new SqlParameter("@cod_produto", SqlDbType.VarChar, 100)).Value = parameter.cod_produto;
                        command.Parameters.Add(new SqlParameter("@descripcion", SqlDbType.VarChar, 100)).Value = parameter.descripcion;
                        command.Parameters.Add(new SqlParameter("@valorUnitario", SqlDbType.VarChar, 100)).Value = parameter.valorUnitario;
                        command.Parameters.Add(new SqlParameter("@estado", SqlDbType.VarChar, 100)).Value = parameter.estado;
                        command.Parameters.Add(new SqlParameter("@fechaCreacion", SqlDbType.VarChar, 100)).Value = parameter.fechaCreacion;

                        command.CommandType = CommandType.StoredProcedure;
                        command.ExecuteNonQuery();
                        command.CommandTimeout = 0;

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (await reader.ReadAsync())
                            {
                                response = new Response()
                                {
                                    Cod = reader["cod_error"].ToString(),
                                    Messeng = reader["message"].ToString(),
                                    Data = "SI incertor",
                                };
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
            return response;
        }
    }
}
