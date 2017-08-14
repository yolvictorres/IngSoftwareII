package Acceso;
import java.util.*;
public interface CRUDyBuscar {
    public String crear (Object obj);
    public String editar (Object obj);
    public String eliminar (Object obj);
    public List<?> consultar ();
    public List<?> filtrar (String tabla, String dato);
    public List<?> buscarPersona (Object obj);
    public List<?> buscarEmpleo (Object obj);
    public List<?> buscarEmpresa (Object obj);
    public List<?> buscarMensaje (Object obj);
    public List<?> buscarPublicacion (Object obj);
    
}
