package cu.edu.cujae.medicina.controller;

import cu.edu.cujae.medicina.core.dto.Consultorios;
import cu.edu.cujae.medicina.core.dto.Especialidad;
import cu.edu.cujae.medicina.core.service.EspecialidadService;
import cu.edu.cujae.medicina.core.util.ResponseReciboUtil;
import cu.edu.cujae.medicina.core.utils.Respuesta_Enum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/especialidades")
public class EspecialidadController {
    @Autowired
    private EspecialidadService especialidadService;

    @PostMapping("/")
    private ResponseEntity<ResponseReciboUtil> insertar_especialidad(@RequestBody Especialidad especialidad){
        try {
            especialidadService.inserta_especialidad(especialidad);
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Buena,"Especialidad insertada"));
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }

    @PutMapping("/")
    private ResponseEntity<ResponseReciboUtil> modificar_especialidad(@RequestBody Especialidad especialidad){
        try {
            especialidadService.modificar_especialidad(especialidad);
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Buena,"Especialidad modificada"));
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }

    @DeleteMapping("/{id}")
    private ResponseEntity<ResponseReciboUtil> insertar_especialidad(@PathVariable Long id){
        try {
            especialidadService.eliminar_especialidad(id);
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Buena,"Especialidad eliminada"));
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }

    @GetMapping("/")
    private ResponseEntity<?> listado_especialidades(){
        try {
            return ResponseEntity.ok(especialidadService.listado_especialidades());
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }

    @GetMapping("/")
    private ResponseEntity<?> listado_especialidades_nombre(){
        try {
            return ResponseEntity.ok(especialidadService.listado_especialidades_nombre());
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }

    @GetMapping("/{id}")
    private ResponseEntity<?> obtener_especialidad_id(@PathVariable Long id){
        try {
            Especialidad especialidad = especialidadService.obtener_especialidad(id);
            if (especialidad == null){
                return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,"No existe la especialidad"));
            }
            else {
                return ResponseEntity.ok(especialidad);
            }
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }


}
