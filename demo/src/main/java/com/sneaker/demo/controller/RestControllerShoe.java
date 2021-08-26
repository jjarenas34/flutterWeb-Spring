package com.sneaker.demo.controller;

import com.sneaker.demo.model.Shoe;
import com.sneaker.demo.model.ShoppingCartUser;
import com.sneaker.demo.service.IShoeService;
import com.sneaker.demo.util.Response;
import com.sneaker.demo.util.ResponseSize;
import com.sneaker.demo.util.SolicitudRecep;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class RestControllerShoe {
    @Autowired
    public IShoeService shoeService;

    @CrossOrigin(origins = "*")
    @GetMapping("/solicitud/lista_zapatillas")
    private ResponseEntity<Response> listaZapatillas() {
        return new ResponseEntity<>(shoeService.listaTopZapatillas(), HttpStatus.OK);
    }
    @CrossOrigin(origins = "*")
    @GetMapping("/solicitud/zapatilla")
    private ResponseEntity<Shoe> obtenerZapatilla() {
        return new ResponseEntity<>(shoeService.obtenerZapatilla(), HttpStatus.OK);
    }

    @CrossOrigin(origins = "*")
    @GetMapping("/solicitud/lista_size/{id}")
    private ResponseEntity<ResponseSize> obtenerSizeShoe(@PathVariable Long id) {
        return new ResponseEntity<>(shoeService.sizesShoes(id), HttpStatus.OK);
    }
    @CrossOrigin(origins = "*")
    @PostMapping("/solicitud/addCart")
    private void addCart(@RequestBody SolicitudRecep nuevaSolicitud){
        ShoppingCartUser cart= new ShoppingCartUser();
        
        cart.setShoe(shoe);
        cart.setShoppingCart(shoppingCart);
        cart.setTalla(talla);

    } 
}
