<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    String usu="";
    String nom="";
    HttpSession sesionOK=request.getSession();
    
if(sesionOK.getAttribute("perfil")!=null)
    nom=(String)sesionOK.getAttribute("nom")+" "+(String)sesionOK.getAttribute("ape");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Venta</title>
    </head>
       <table border="0" width="1000" align="center">
            <tr bgcolor="skyblue">
                <th><a href="index.jsp">Catálogo</th>
                <%
                if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Admin")){
                    %>
                <th><a href="registrarProducto.jsp">Registrar Producto</th>
                <%
                    }
                
                    if(sesionOK.getAttribute("perfil")!=null){
                %>
                <th><a href="RegistrarVenta.jsp">Registrar Venta</th>
                <%
                    }
                
                if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Admin")){
                    %>
                <th><a href="ServletControlador?accion=MostrarVentas.jsp">Consultar Ventas</th>
                <%
                    }
                    if(sesionOK.getAttribute("perfil")!=null){
                        %>
                <th><a href="ServletLogueo?accion=cerrar">Cerrar Sesión</th>
                 <th width="200"><%out.println("Bienvenido: "+nom);%></th>
                <%
                }
                    %>
                    <%
                    if(sesionOK.getAttribute("perfil")==null){
                        %> 
                    <th width="200"><a href="login.jsp">Iniciar sesión</a></th>
                    <%
                        }
                    %>
                
            </tr>
            
        </table>
        
        <form action="ServletControlador" method="post">
            
            <input type="hidden" name="accion" value="registrarVenta"><!-- comment -->
            <p>
            <p>
            <table border="1" align="center" width="400">
                <tr>
                    <th>Cliente: </th>
                    <th colspan="4"><input type="text" name="txtCliente" value="<%
                        if(sesionOK.getAttribute("perfil")!=null)
                        out.println(nom);%>" readonly="readonly"></th>
                </tr>
                <tr style="background-color: skyblue; color:black; font-weight:bold">
                    <td>Nombre</td>
                    <td>Precio</td><!-- comment -->
                    <td>Cantidad</td>
                    <td>Descuento</td>
                    <td>Subtotal</td><!-- comment -->
                </tr>
                
               <%
                    double total=0;
                    ArrayList<DetalleVenta> lista=(ArrayList<DetalleVenta>)session.getAttribute("carrito");
                
                if (lista!=null){
                    
                        for(DetalleVenta d:lista){
                 %>           
                            <tr>
                                <td><%=d.getProducto().getNombre()%></td><!-- comment -->
                                <td><%=d.getProducto().getPrecio()%></td>
                                <td><%=d.getCantidad()%></td>
                                <td><%=String.format("%.2f",d.getDescuento())%></td>
                                <td><%=String.format("%.2f",(d.getProducto().getPrecio()*d.getCantidad()))%></td>
                            </tr>
                        
                   <%
                        total=total+(d.getProducto().getPrecio()*d.getCantidad())-d.getDescuento();
                }
               
}
               %>
               <tr>
                   <th colspan="4" align="right">Total</th><!-- comment -->
                   <th><%=String.format("%.2f",total)%></th>
               </tr>
               <tr>
                   <th colspan="5">
                       <input type="submit" name="btnVenta" value="registrarVenta">
                   </th>
               </tr>
               <tr>
                   <th colspan="5"><a href="index.jsp">Seguir Comprando</a>||<a href="ServletLogueo?accion=Cancelar">Cancelar compra</a></th>
                   
               </tr>
               
                </table>
               <input type="hidden" name="total" value="<%=total%>">
                       </form>
            
    
</html>
