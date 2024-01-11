package cu.edu.cujae.medicina.core.service;

import cu.edu.cujae.medicina.core.dto.Doctor;

import java.util.ArrayList;

public interface DoctorService {
    public void inserta_doctor(Doctor doctor) throws Exception;
    public void modificar_doctor(Doctor doctor)throws Exception;
    public void eliminar_doctor(Long id)throws Exception;
    public ArrayList<Doctor> listado_doctores()throws Exception;
    public ArrayList<String> listado_doctores_nombre() throws Exception;
    public Doctor obtener_doctor(long id)throws Exception;
}
