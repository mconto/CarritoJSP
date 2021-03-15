
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Producto</title>
    </head>
    <body>
        
<%
    Producto p=ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("id")));
%>  
        
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
        <h2 align="center">ACTUALIZAR PRODUCTO</h2>
        <form action="ServletControlador" method="post">
            <table align="center" border="0" width="400">
                <tr>
                    <th>Código:</th>
                    <th><input type="text" name="txtCodigo" value="<%=p.getCodigoProducto()%>" readonly></th>
                </tr>
                <tr>
                    <th>Nombre:</th>
                    <th><input type="text" name="txtNombre" value="<%=p.getNombre()%>"></th>
                </tr>
                <tr>
                    <th>Precio:</th>
                    <th><input type="text" name="txtPrecio" value="<%p.getPrecio();%>"></th>
                </tr>
                <tr>
                    <th colspan="2"><input type="submit" value="Actualizar Producto" name="btnActualizar">
                        <input type="hidden" name="accion" value="ModificarProducto">
                    </th>
                    
                </tr>
                    
           
                
            
            
            
        </form>
    </body>
</html>
