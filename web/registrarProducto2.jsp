
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
        
        <h2 align="center">
            <form class="form-horizontal" action="ServletControlador" method="get">
                <table border="0" width="350" align="center">
                    <%
                        String img=request.getParameter("img");
                %>
                <tr>
                    <th>Nombre: </th>
                    <th><input type="text" name="txtNombre"></th>
                </tr>
                <tr>
                    <th>Precio: </th>
                    <th> <input type="text" name="txtPrecio" value="0"></th>
                </tr>
                <tr>
                    <th colspan="2"> <input type="submit" value="Registrar" name="CargarImagen">
                </tr>
                <input type="hidden" name="txtImagen" value="<%=img%>">
                <input type="hidden" name="accion" value="registrarProducto">
            </table>
                
            </form>
        </h2>
        
    </body>
</html>
