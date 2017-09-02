package Modelo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;

public class Persona {

    private int idPersona;
    private String clavePersona;
    private String nombresPersona;
    private String apellidosPersona;
    private int telefono;
    Date edad = new Date();
    private String correoPersona;
    private ArrayList<String> interesLaboral;
    private String rutaFoto;
    private String rutaHojadevida;

    public Persona(int idPersona, String nombresPersona, String apellidosPersona, int telefono, String correoPersona, Date edad) {
        this.idPersona = idPersona;
        this.nombresPersona = nombresPersona;
        this.apellidosPersona = apellidosPersona;
        this.telefono = telefono;
        this.correoPersona = correoPersona;
        this.edad = edad;
    }

    public Persona(int idPersona, String rutaFoto) {
        this.idPersona = idPersona;
        this.rutaFoto = rutaFoto;
    }



    
    
    public Persona(int idPersona, String nombresPersona, String apellidosPersona, int telefono, Date edad, String correoPersona, String rutaFoto, String rutaHojadevida) {
        this.idPersona = idPersona;
        this.nombresPersona = nombresPersona;
        this.apellidosPersona = apellidosPersona;
        this.telefono = telefono;
        this.edad = edad;
        this.correoPersona = correoPersona;
        this.rutaFoto = rutaFoto;
        this.rutaHojadevida = rutaHojadevida;
    }

    public Persona() {

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

    public Date getEdad() {
        return edad;
    }

    public void setEdad(Date edad) {
        this.edad = edad;
    }

    public String getCorreoPersona() {
        return correoPersona;
    }

    public void setCorreoPersona(String correoPersona) {
        this.correoPersona = correoPersona;
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
