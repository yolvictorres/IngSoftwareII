package Modelo;


public class Mensaje {
    
    private int idMensaje;
    private int idUsuario1;
    private int idUsuario2;
    private String mensaje;
    private String fecha;    

    public Mensaje(int idMensaje, int idUsuario1, int idUsuario2, String mensaje) {
        this.idMensaje = idMensaje;
        this.idUsuario1 = idUsuario1;
        this.idUsuario2 = idUsuario2;
        this.mensaje = mensaje;
    }

    public int getIdMensaje() {
        return idMensaje;
    }

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public int getIdUsuario1() {
        return idUsuario1;
    }

    public void setIdUsuario1(int idUsuario1) {
        this.idUsuario1 = idUsuario1;
    }

    public int getIdUsuario2() {
        return idUsuario2;
    }

    public void setIdUsuario2(int idUsuario2) {
        this.idUsuario2 = idUsuario2;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    
}
