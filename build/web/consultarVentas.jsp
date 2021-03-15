
<%@page import="Modelo.*, java.util.*"%>
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
        <title>JSP Page</title>
    </head>
    <body>
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
        
        <h2 align="center">CONSULTAR VENTAS</h2>
        <table border="1" width="600" align="center">
            <tr bgcolor="skyblue"><th>Código</th><th>Nombre</th><th>Precio</th></tr>
            <%
                ArrayList<Venta> lista=(ArrayList<Venta>)request.getAttribute("lista");
                for (Venta v:lista){
                    %>
            <tr>
                <td><%=v.getCodigoVenta()%></td><!-- comment -->
                <td><%=v.getCliente()%></td>
                <td><%=v.getFecha()%></td>
                <th><a href="obtenerDetalleVenta.jsp?cod=<%=v.getCodigoVenta()%>" target="detalle">Ver Detalle</a></th>
            </tr>
        <!-- comment -->
        <%
                }
            %>
            </table>
            <div style="margin: 0 auto;width: 650px;">
                <iframe name="detalle" width="630" height="300" frameborder="0">
                    
                </iframe>
            </div>
    </body>
</html>
