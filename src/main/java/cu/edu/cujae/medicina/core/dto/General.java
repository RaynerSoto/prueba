package cu.edu.cujae.medicina.core.dto;

import org.springframework.lang.NonNull;

public abstract class General extends DBobject{
    @NonNull
    private String nombre;

    public General() {
    }

    public General(Long id, String nombre) {
        super(id);
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
