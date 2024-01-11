package cu.edu.cujae.medicina.core.dto;

import org.springframework.lang.NonNull;

public class Consultorios extends DBobject{
    @NonNull
    private String numero;
    @NonNull
    private long piso;

    public Consultorios() {
    }

    public Consultorios(Long id, String numero, long piso) {
        super(id);
        this.numero = numero;
        this.piso = piso;
    }

    @Override
    public String toString(){
        return "El id del consultorio es: " + String.valueOf(getId()) + "con el número: " + numero + " que se encuentra en el piso" + String.valueOf(piso);
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public long getPiso() {
        return piso;
    }

    public void setPiso(long piso) {
        this.piso = piso;
    }
}
