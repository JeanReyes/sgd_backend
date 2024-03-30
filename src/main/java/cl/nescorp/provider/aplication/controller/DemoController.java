package cl.nescorp.provider.aplication.controller;

import io.swagger.v3.oas.annotations.Hidden;

import java.util.HashMap;

import org.hibernate.mapping.Map;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/demo-controller")
@Hidden
public class DemoController {

  @GetMapping
  public ResponseEntity<String> sayHello() {
    System.out.println("Hello from secured endpoint");
    return ResponseEntity.ok("Hello from secured endpoint");
  }

   @GetMapping("/datos")
    public ResponseEntity<java.util.Map<String, String>> obtenerDatos() {
        java.util.Map<String, String> datos = new HashMap<>();
        datos.put("nombre", "Jean");
        datos.put("profesion", "Desarrollador");

        return ResponseEntity.ok(datos);
    }


}
