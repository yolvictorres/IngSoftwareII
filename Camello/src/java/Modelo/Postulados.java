
package Modelo;

/**
 *
 * @author IAN
 */
public class Postulados {
    private int codigoEmpleo;
    private int codigoEmpresa;    
    private int codigoPersona;
    private int estadoEnvio;
    private int estadoPostulados;    

    public Postulados() {
    }

    public Postulados(int codigoEmpleo, int codigoEmpresa, int codigoPersona, int estadoEnvio, int estadoPostulados) {
        this.codigoEmpleo = codigoEmpleo;
        this.codigoEmpresa = codigoEmpresa;
        this.codigoPersona = codigoPersona;
        this.estadoEnvio = estadoEnvio;
        this.estadoPostulados = estadoPostulados;
    }

    public int getCodigoEmpresa() {
        return codigoEmpresa;
    }

    public void setCodigoEmpresa(int codigoEmpresa) {
        this.codigoEmpresa = codigoEmpresa;
    }



    public int getCodigoEmpleo() {
        return codigoEmpleo;
    }

    public void setCodigoEmpleo(int codigoEmpleo) {
        this.codigoEmpleo = codigoEmpleo;
    }

    public int getCodigoPersona() {
        return codigoPersona;
    }

    public void setCodigoPersona(int codigoPersona) {
        this.codigoPersona = codigoPersona;
    }

    public int getEstadoEnvio() {
        return estadoEnvio;
    }

    public void setEstadoEnvio(int estadoEnvio) {
        this.estadoEnvio = estadoEnvio;
    }

    public int getEstadoPostulados() {
        return estadoPostulados;
    }

    public void setEstadoPostulados(int estadoPostulados) {
        this.estadoPostulados = estadoPostulados;
    }
    
    
}
