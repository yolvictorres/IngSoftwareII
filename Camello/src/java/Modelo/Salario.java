package Modelo;

/**
 *
 * @author IAN
 */
public class Salario {

    private int idsalario;
    private String salario;

    public Salario() {
    }

    public Salario(int idsalario, String salario) {
        this.idsalario = idsalario;
        this.salario = salario;
    }

    public int getIdSalario() {
        return idsalario;
    }

    public void setIdSalario(int id) {
        this.idsalario = id;
    }

    public String getSalario() {
        return salario;
    }

    public void setSalario(String salario) {
        this.salario = salario;
    }

}
