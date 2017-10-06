package Modelo;

/**
 *
 * @author IAN
 */
public class Amigos {

    private int idPersona;
    private int idAmigo;
    private int Estado;

    public Amigos() {
    }

    public Amigos(int idPersona, int idAmigo, int Estado) {
        this.idPersona = idPersona;
        this.idAmigo = idAmigo;
        this.Estado = Estado;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public int getIdAmigo() {
        return idAmigo;
    }

    public void setIdAmigo(int idAmigo) {
        this.idAmigo = idAmigo;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }

}
