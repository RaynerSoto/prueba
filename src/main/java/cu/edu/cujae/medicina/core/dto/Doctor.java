package cu.edu.cujae.medicina.core.dto;

import org.springframework.lang.NonNull;

public class Doctor extends General {
    @NonNull
    private String apellido_paterno;
    @NonNull
    private String apellido_materno;
    @NonNull
    private Especialidad especialidad;

    public Doctor() {
    }

    public Doctor(Long id, String nombre, String apellido_paterno, String apellido_materno,Long especialidad) {
        super(id, nombre);
        this.apellido_paterno = apellido_paterno;
        this.apellido_materno = apellido_materno;
        this.especialidad.setId(especialidad);
    }


    public Doctor(Long id, String nombre, String apellido_paterno, String apellido_materno,Especialidad especialidad) {
        super(id, nombre);
        this.apellido_paterno = apellido_paterno;
        this.apellido_materno = apellido_materno;
        this.especialidad = especialidad;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    public Especialidad getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(Especialidad especialidad) {
        this.especialidad = especialidad;
    }
}
