package Modelo;

import java.util.ArrayList;

public class Usuario {
    
    private int idUsuario;
    private String nombresUsuario;
    private String apellidosUsuario;
    private int telefono;
    private int edad;
    private String correoUsuario;
    private String direccionUsuario;
    private ArrayList<String> interesLaboral;
    private String rutaFoto;
    private String rutaHojadevida;

    public Usuario(String nombresUsuario, String apellidosUsuario, int telefono, int edad, String correoUsuario, String direccionUsuario, ArrayList<String> interesLaboral) {
        this.nombresUsuario = nombresUsuario;
        this.apellidosUsuario = apellidosUsuario;
        this.telefono = telefono;
        this.edad = edad;
        this.correoUsuario = correoUsuario;
        this.direccionUsuario = direccionUsuario;
        this.interesLaboral = interesLaboral;
    }



    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombresUsuario() {
        return nombresUsuario;
    }

    public void setNombresUsuario(String nombresUsuario) {
        this.nombresUsuario = nombresUsuario;
    }

    public String getApellidosUsuario() {
        return apellidosUsuario;
    }

    public void setApellidosUsuario(String apellidosUsuario) {
        this.apellidosUsuario = apellidosUsuario;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getCorreoUsuario() {
        return correoUsuario;
    }

    public void setCorreoUsuario(String correoUsuario) {
        this.correoUsuario = correoUsuario;
    }

    public String getDireccionUsuario() {
        return direccionUsuario;
    }

    public void setDireccionUsuario(String direccionUsuario) {
        this.direccionUsuario = direccionUsuario;
    }

    public ArrayList<String> getInteresLaboral() {
        return interesLaboral;
    }

    public void setInteresLaboral(ArrayList<String> interesLaboral) {
        this.interesLaboral = interesLaboral;
    }

    public String getRutaFoto() {
        return rutaFoto;
    }

    public void setRutaFoto(String rutaFoto) {
        this.rutaFoto = rutaFoto;
    }

    public String getRutaHojadevida() {
        return rutaHojadevida;
    }

    public void setRutaHojadevida(String rutaHojadevida) {
        this.rutaHojadevida = rutaHojadevida;
    }


    
    
    
}

