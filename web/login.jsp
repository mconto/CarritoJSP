

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
        
        <h2 align="center">Logueo de usuarios</h2>
        <table border="0" width="300" align="center">
            <form action="ServletLogueo" method="post">
                <input type="hidden" name="accion" value="loguin">
                <tr>
                    <td>Usuario: </td>
                    <td><input type="text" placeholder="Usuario" name="txtUsu"></td>
                </tr>
                <tr>
                    <td>Password: </td><!-- comment -->
                    <td><input type="text" placeholder="Password" name="txtPas"></td>
                </tr>
                <tr>
                    <th colspan="2"><input type="submit" name="btn" value="Iniciar sesión"></th>
                </tr>
            </form>
        </table>
        
        <h4 align="center">
            <%
                if (request.getAttribute("msg")!=null){
                    out.println(request.getAttribute("msg"));
                }
                %>
        </h4>
            
    </body>
</html>
