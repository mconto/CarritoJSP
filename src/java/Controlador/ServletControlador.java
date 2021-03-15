package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.*;
import java.util.ArrayList;
import java.util.HashSet;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mauricio
 */
@WebServlet(urlPatterns = {"/ServletControlador"})
public class ServletControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion=request.getParameter("accion");
        
        if (accion.equals("anadirCarrito")){
            this.anadirCarrito(request,response);
        }else if (accion.equals("ModificarProducto")){
                this.actualizarProducto(request,response);
            }else if (accion.equals("registrarProducto")){
                    this.registrarProducto(request,response);
                }else if (accion.equals("registrarVenta")){
                        this.registrarVenta(request,response);
                    } else if (accion.equals("MostrarVentas.jsp")){
                            this.mostrarVentas(request,response);
                            }
                    
            
 
    }
    
    private void mostrarVentas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Venta> lista= new ArrayList<>();
        lista=VentaDB.obtenerVentas();
        request.setAttribute("lista",lista);
        request.getRequestDispatcher("consultarVentas.jsp").forward(request, response);
        
        
    }
          
        
    private void anadirCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion=request.getSession();
        
        ArrayList<DetalleVenta> carrito;
        if (sesion.getAttribute("carrito")==null){
            carrito=new ArrayList<DetalleVenta>();
        }else{
                carrito=(ArrayList<DetalleVenta>) sesion.getAttribute("carrito");
        }
                Producto p=ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("txtCodigo")));
                DetalleVenta d = new DetalleVenta();
                d.setCodigoProducto(Integer.parseInt(request.getParameter("txtCodigo")));
                d.setProducto(p);
                d.setCantidad(Double.parseDouble(request.getParameter("txtCantidad")));
                double subTotal=p.getPrecio()*d.getCantidad();
                if (subTotal>50){
                    d.setDescuento(subTotal*0.3);
                }
                else{
                    d.setDescuento(0);
                    }
                int indice=-1;
                
                for (int i=0;i<carrito.size();i++){
                    DetalleVenta det=carrito.get(i);
                    if (det.getCodigoProducto()==p.getCodigoProducto()){
                        indice=i;
                        break;
                        
                    }
                }
                    if (indice==-1){
                        carrito.add(d);
                        
                    }
                sesion.setAttribute("carrito",carrito);
                response.sendRedirect("RegistrarVenta.jsp");
                
                
            
            
            
        }
        
    private void actualizarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto p=new Producto(Integer.parseInt(request.getParameter("txtCodigo")),request.getParameter(("txtNombre").toString()),Double.parseDouble(request.getParameter("txtPrecio")));
       boolean rpta = ProductoDB.actualizarProducto(p);
       
       if (rpta){
           response.sendRedirect("mensaje.jsp?men=Se actualizó el producto de manera correcta");
       }
       else{
            response.sendRedirect("mensaje.jsp?men=No se actualizó el producto");
           }
       }
    
    private void registrarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pro=request.getParameter("txtNombre");
        Double pre=Double.parseDouble(request.getParameter("txtPrecio"));
        String img=request.getParameter("txtImagen");
        
        Producto p=new Producto(pro,pre,img);
        boolean rpta=ProductoDB.insertarProducto(p);
        
        if (rpta){
            response.sendRedirect("mensaje.jsp?men=Se registró el producto de manera exitosa.");
            }else{
            response.sendRedirect("mensaje.jsp?men=No se registró el producto.");
        }
        
    }
    
    private void registrarVenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion=request.getSession();
        Venta v=new Venta();
        v.setCliente(request.getParameter("txtCliente").toUpperCase());
        ArrayList<DetalleVenta> detalle=(ArrayList<DetalleVenta>) sesion.getAttribute("carrito");
        boolean rpta=VentaDB.insertarVenta(v, detalle);
        double total=Double.parseDouble(request.getParameter("total"));
        
        if(rpta){
            request.getSession().removeAttribute("carrito");
            response.sendRedirect("FormularioPago.jsp?total="+total);
            //response.sendRedirect("mensaje.jsp?men=Se registró la venta exitosamente.");
        }
        
        }
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}


   