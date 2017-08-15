package Modelo;

import java.util.ArrayList;

public class Persona {
    
    private int idPersona;
    private String clavePersona;
    private String nombresPersona;
    private String apellidosPersona;
    private int telefono;
    private int edad;
    private String correoPersona;
    private String direccionPersona;
    private ArrayList<String> interesLaboral;
    private String rutaFoto;
    private String rutaHojadevida;

    public Persona(int idPersona, String nombresPersona, String apellidosPersona, int telefono, int edad, String correoPersona, String direccionPersona, ArrayList<String> interesLaboral) {
        this.idPersona = idPersona;
        this.nombresPersona = nombresPersona;
        this.apellidosPersona = apellidosPersona;
        this.telefono = telefono;
        this.edad = edad;
        this.correoPersona = correoPersona;
        this.direccionPersona = direccionPersona;
        this.interesLaboral = interesLaboral;
    }

    public Persona() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombresPersona() {
        return nombresPersona;
    }

    public void setNombresPersona(String nombresPersona) {
        this.nombresPersona = nombresPersona;
    }

    public String getApellidosPersona() {
        return apellidosPersona;
    }

    public void setApellidosPersona(String apellidosPersona) {
        this.apellidosPersona = apellidosPersona;
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

    public String getCorreoPersona() {
        return correoPersona;
    }

    public void setCorreoPersona(String correoPersona) {
        this.correoPersona = correoPersona;
    }

    public String getDireccionPersona() {
        return direccionPersona;
    }

    public void setDireccionPersona(String direccionPersona) {
        this.direccionPersona = direccionPersona;
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

    public String getClavePersona() {
        return clavePersona;
    }

    public void setClavePersona(String contraseñaPersona) {
        this.clavePersona = contraseñaPersona;
    }

   
    
}

