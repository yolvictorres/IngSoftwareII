package Acceso;
import java.util.*;
public interface CRUD {
    public String crear (Object obj);
    public String editar (Object obj);
    public String eliminar (Object obj);
    public List<?> consultar ();
    public List<?> filtrar (String tabla, String dato);
}
