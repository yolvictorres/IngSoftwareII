package Modelo;

public class Empleo {

    private int idEmpleo;
    private int idEmpresa;
    private int idCiudad;
    private int idJornada;
    private int idCargo;
    private int idSalario;
    private String detalles;
    private String fecha;
    private String experiencia;

    public Empleo() {

    }

    public Empleo(int idEmpleo, int idEmpresa, int idCiudad, int idJornada, int idCargo, int idSalario, String detalles, String fecha, String experiencia) {
        this.idEmpleo = idEmpleo;
        this.idEmpresa = idEmpresa;
        this.idCiudad = idCiudad;
        this.idJornada = idJornada;
        this.idCargo = idCargo;
        this.idSalario = idSalario;
        this.detalles = detalles;
        this.fecha = fecha;
        this.experiencia = experiencia;
    }

    public int getIdEmpleo() {
        return idEmpleo;
    }

    public void setIdEmpleo(int idEmpleo) {
        this.idEmpleo = idEmpleo;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idPublicador) {
        this.idEmpresa = idPublicador;
    }

    public String getDetalles() {
        return detalles;
    }

    public void setDetalles(String detalles) {
        this.detalles = detalles;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public String getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(String experiencia) {
        this.experiencia = experiencia;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int ciudad) {
        this.idCiudad = ciudad;
    }

    public int getIdJornada() {
        return idJornada;
    }

    public void setIdJornada(int jornada) {
        this.idJornada = jornada;
    }

    public int getIdSalario() {
        return idSalario;
    }

    public void setIdSalario(int idSalario) {
        this.idSalario = idSalario;
    }

}
