package cu.edu.cujae.medicina.core.dto;

import org.springframework.lang.NonNull;

import java.sql.Date;

public class Citas extends  DBobject{
    @NonNull
    private Long id_consultorio;
    @NonNull
    private Long id_doctor;
    @NonNull
    private Date fecha_consulta;
    @NonNull
    private String nombre_paciente;

    public Citas() {
    }

    public Citas(Long id, Long id_consultorio, Long id_doctor, Date fecha_consulta, String nombre_paciente) {
        super(id);
        this.id_consultorio = id_consultorio;
        this.id_doctor = id_doctor;
        this.fecha_consulta = fecha_consulta;
        this.nombre_paciente = nombre_paciente;
    }

    @NonNull
    public Long getId_consultorio() {
        return id_consultorio;
    }

    public void setId_consultorio(@NonNull Long id_consultorio) {
        this.id_consultorio = id_consultorio;
    }

    @NonNull
    public Long getId_doctor() {
        return id_doctor;
    }

    public void setId_doctor(@NonNull Long id_doctor) {
        this.id_doctor = id_doctor;
    }

    @NonNull
    public Date getFecha_consulta() {
        return fecha_consulta;
    }

    public void setFecha_consulta(@NonNull Date fecha_consulta) {
        this.fecha_consulta = fecha_consulta;
    }

    @NonNull
    public String getNombre_paciente() {
        return nombre_paciente;
    }

    public void setNombre_paciente(@NonNull String nombre_paciente) {
        this.nombre_paciente = nombre_paciente;
    }
}
