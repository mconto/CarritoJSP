<%@page import="Modelo.*"%>
<%@page import="java.util.*"%>
<%@page import="utils.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    String usu="";
    String nom="";
    HttpSession sesionOK=request.getSession();
    
if(sesionOK.getAttribute("perfil")!=null)
    nom=(String)sesionOK.getAttribute("nom")+" "+(String)sesionOK.getAttribute("ape");
    if(sesionOK.getAttribute("perfil")==null){
%>
<jsp:forward page="login.jsp"/>
    <%
        }
else {
usu=(String)sesionOK.getAttribute("perfil");
}

    Producto p=ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("id")));
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
        
        <h2 align="center">
            Añadir producto a carrito
        </h2>
        
        <table border="2" width="500" align="center">
            <form action="ServletControlador" method="post">
            <tr>
                <th rowspan="5"><img src="img/<%=p.getImagen()%>" widtth="140" heigh="140"></th>
                <th>Código</th>
                <th><input type="text" name="txtCodigo" value="<%=p.getCodigoProducto()%>" readonly></th>
            </tr>
            <tr>
                <th>Nombre:</th>
                <th><input type="text" name="txtNombre" value="<%=p.getNombre()%>" readonly></th>
            <tr>
                <th>Precio:</th>
                <th><input type="text" name="txtPrecio" value="<%=p.getPrecio()%>" readonly></th>
            </tr>
            <tr>
                <th>Cantidad:</th>
                <th><input type="number" value="0" min="0" name="txtCantidad" value="0"></th>
            </tr>    
            <tr>
                <th colspan="3"><input type="submit" name="btnAnadir" value="Añadir">
                    <input type="hidden" name="accion" value="anadirCarrito">
            </tr>
            
            </form>
        </table>
    </body>
</html>
