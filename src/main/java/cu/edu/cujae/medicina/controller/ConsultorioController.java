package cu.edu.cujae.medicina.controller;

import jdk.javadoc.doclet.Reporter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import cu.edu.cujae.medicina.core.dto.Consultorios;
import cu.edu.cujae.medicina.core.util.*;
import cu.edu.cujae.medicina.core.service.ConsultoriosService;
import cu.edu.cujae.medicina.core.utils.Respuesta_Enum;



@RestController
@RequestMapping("/api/v1/consultorios")
public class ConsultorioController {
    @Autowired
    private ConsultoriosService consultoriosService;

    @PostMapping("/")
    private ResponseEntity<ResponseReciboUtil> insertar_consultorio(@RequestBody Consultorios consultorios){
        try {
            consultoriosService.inserta_consultorio(consultorios);
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Buena,"Consultorio insertado"));
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }

    @GetMapping("/{id}")
    private ResponseEntity<?> obtener_consultorio_id(@PathVariable Long id){
        try {
            Consultorios consultorios = consultoriosService.obtener_consultorios(id);
            if (consultorios == null){
                return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,"No existe el consultorio"));
            }
            else {
                return ResponseEntity.ok(consultorios);
            }
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }

    @PutMapping("/")
    private ResponseEntity<ResponseReciboUtil> modificar_consultorio(@RequestBody Consultorios consultorios){
        try {
            consultoriosService.modificar_consultorio(consultorios);
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Buena,"Consultorio modificado"));
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }

    @DeleteMapping("/{id}")
    private ResponseEntity<ResponseReciboUtil> modificar_consultorio(@PathVariable Long id){
        try {
            consultoriosService.eliminar_consultorios(id);
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Buena,"Consultorio eliminado"));
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }

    @GetMapping("/")
    private ResponseEntity<?> listado_consultorios(){
        try {
            return ResponseEntity.ok(consultoriosService.listado_consultorios());
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }

    @GetMapping("/numeros")
    private ResponseEntity<?> listado_consultorios_numero(){
        try {
            return ResponseEntity.ok(consultoriosService.listado_consultorios_numero());
        }catch (Exception e){
            return ResponseEntity.ok(new ResponseReciboUtil(Respuesta_Enum.Mala,e.getMessage()));
        }
    }
}
