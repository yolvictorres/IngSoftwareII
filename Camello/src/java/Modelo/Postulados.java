
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
    private int estadoNotificacion;    
    private String mensaje;    
    private String to;
    private String from;
    private String message;
    private String subject;
    private String smtpServ;

    public Postulados() {
    }

    public Postulados(int codigoEmpleo, int codigoEmpresa, int codigoPersona, int estadoEnvio, int estadoPostulados, int estadoNotificacion, String mensaje) {
        this.codigoEmpleo = codigoEmpleo;
        this.codigoEmpresa = codigoEmpresa;
        this.codigoPersona = codigoPersona;
        this.estadoEnvio = estadoEnvio;
        this.estadoPostulados = estadoPostulados;
        this.estadoNotificacion = estadoNotificacion;
        this.mensaje = mensaje;
    }

    public int getCodigoEmpleo() {
        return codigoEmpleo;
    }

    public void setCodigoEmpleo(int codigoEmpleo) {
        this.codigoEmpleo = codigoEmpleo;
    }

    public int getCodigoEmpresa() {
        return codigoEmpresa;
    }

    public void setCodigoEmpresa(int codigoEmpresa) {
        this.codigoEmpresa = codigoEmpresa;
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

    public int getEstadoNotificacion() {
        return estadoNotificacion;
    }

    public void setEstadoNotificacion(int estadoNotificacion) {
        this.estadoNotificacion = estadoNotificacion;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSmtpServ() {
        return smtpServ;
    }

    public void setSmtpServ(String smtpServ) {
        this.smtpServ = smtpServ;
    }


}
