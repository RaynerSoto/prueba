package cu.edu.cujae.medicina.core.service;


import cu.edu.cujae.medicina.core.dto.Consultorios;

import java.util.ArrayList;

public interface ConsultoriosService {
    public void inserta_consultorio(Consultorios consultorios) throws Exception;
    public void modificar_consultorio(Consultorios consultorios)throws Exception;
    public void eliminar_consultorios(Long id)throws Exception;
    public ArrayList<Consultorios> listado_consultorios()throws Exception;
    public ArrayList<String>listado_consultorios_numero() throws Exception;
    public Consultorios obtener_consultorios(long id)throws Exception;
}
