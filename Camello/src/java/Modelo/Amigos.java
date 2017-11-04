package Modelo;

/**
 *
 * @author IAN
 */
public class Amigos {

    private int idPersona;
    private int idAmigo;
    private int Estado;
    private int Notificacion;
    private String to;
    private String from;
    private String message;
    private String subject;
    private String smtpServ;

    public Amigos() {
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


    public Amigos(int idPersona, int idAmigo, int Estado, int Notificacion) {
        this.idPersona = idPersona;
        this.idAmigo = idAmigo;
        this.Estado = Estado;
        this.Notificacion = Notificacion;
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

    public int getNotificacion() {
        return Notificacion;
    }

    public void setNotificacion(int Notificacion) {
        this.Notificacion = Notificacion;
    }
    
  

}
