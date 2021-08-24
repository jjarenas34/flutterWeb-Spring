package com.sneaker.demo.service;

import com.sneaker.demo.model.Shoe;
import com.sneaker.demo.util.Response;
import com.sneaker.demo.util.ResponseSize;

public interface IShoeService {
    Response listaTopZapatillas();

    Shoe obtenerZapatilla();

    ResponseSize sizesShoes(Long id);
}
