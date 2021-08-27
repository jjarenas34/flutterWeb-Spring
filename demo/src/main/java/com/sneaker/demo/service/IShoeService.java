package com.sneaker.demo.service;

import com.sneaker.demo.model.Shoe;
import com.sneaker.demo.model.ShoppingCart;
import com.sneaker.demo.model.ShoppingCartUser;
import com.sneaker.demo.model.Size;
import com.sneaker.demo.util.Response;
import com.sneaker.demo.util.ResponseSize;

public interface IShoeService {
    Response listaTopZapatillas();

    Shoe obtenerZapatilla();

    ResponseSize sizesShoes(Long id);

    Shoe getShoe(long id);

    ShoppingCart getShoppingCart(long id);

    Size getSize(long id);

    void setCartUser(ShoppingCartUser shoppingUser);
}
