
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Modelo.*, java.util.*"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       
        
        <table border="1" width="600" align="center">
            <tr bgcolor="skyblue">
                <th>Código Producto</th><!-- comment -->
                <th>Cantidad</th>
                <th>Descuento</th>
            </tr>
            <%
                ArrayList<DetalleVenta> lista = 
                        DetalleVentaDB.obtenerDetalleVenta(Integer.parseInt(request.getParameter("cod")));
                for (int i=0;i<lista.size();i++){
                    DetalleVenta d=lista.get(i);
                    %>
                    <tr>
                        <th><%=d.getCodigoProducto()%></th><!-- comment -->
                        <th><%=d.getCantidad()%></th><!-- comment -->
                        <th><%=d.getDescuento()%></th><!-- comment -->
                    </tr>
                <%
                    }
                %>
        </table>
    </body>
</html>
