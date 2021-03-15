
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
        <h1 align="center">
            <%
                double total=Double.parseDouble(request.getParameter("total"));
                String correo=request.getParameter("correo");
                out.println("Total a pagar: "+total+"<p>");
                %>
                
<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_ext-enter" />
<input type="hidden" name="redirect_cmd" value="_xclick" />
<input type="hidden" name="business" value="mconto@gmail.com" />
<input type="hidden" name="item_name" value="Productos varios" />
<input type="hidden" name="quantity" value="1" />
<input type="hidden" name="amount" value="<%=total%>" />
<input type="hidden" name="currency_code" value="USD" />
<input type="hidden" name="return" value="http://localhost:8081/CarritoJSP/index.jsp" />
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest" />
<input type="image" src="http://www.paypal.com/es_XC/i/btn/x-click-but01.gif" border="0" name="submit" alt="Pagar para completar la compra." />

</form>



                

    </body>
</html>
