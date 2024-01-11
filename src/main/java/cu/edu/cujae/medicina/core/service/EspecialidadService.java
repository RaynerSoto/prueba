package cu.edu.cujae.medicina.core.service;

import cu.edu.cujae.medicina.core.dto.Especialidad;

import java.util.ArrayList;

public interface EspecialidadService {
    public void inserta_especialidad(Especialidad especialidad) throws Exception;
    public void modificar_especialidad(Especialidad especialidad)throws Exception;
    public void eliminar_especialidad(Long id)throws Exception;
    public ArrayList<Especialidad> listado_especialidades()throws Exception;
    public ArrayList<String> listado_especialidades_nombre() throws Exception;
    public Especialidad obtener_especialidad(long id)throws Exception;
}
