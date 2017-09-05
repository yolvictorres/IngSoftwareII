package Modelo;


public class Ciudad {
    private int idCiudad;
    private int idPais;
    private String nombreCiudad;

    public Ciudad() {
    }

    public Ciudad(int idCiudad, int idPais, String nombreCiudad) {
        this.idCiudad = idCiudad;
        this.idPais = idPais;
        this.nombreCiudad = nombreCiudad;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    public int getIdPais() {
        return idPais;
    }

    public void setIdPais(int idPais) {
        this.idPais = idPais;
    }

    public String getNombreCiudad() {
        return nombreCiudad;
    }

    public void setNombreCiudad(String nombreCiudad) {
        this.nombreCiudad = nombreCiudad;
    }
    
    
}
