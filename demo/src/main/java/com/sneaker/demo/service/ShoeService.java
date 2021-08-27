package com.sneaker.demo.service;

import com.sneaker.demo.Repository.ShoeRepository;
import com.sneaker.demo.Repository.ShoppingCartRepository;
import com.sneaker.demo.Repository.ShoppingCartUserRepository;
import com.sneaker.demo.Repository.SizesRepository;
import com.sneaker.demo.model.Shoe;
import com.sneaker.demo.model.ShoppingCart;
import com.sneaker.demo.model.ShoppingCartUser;
import com.sneaker.demo.model.Size;
import com.sneaker.demo.util.Response;
import com.sneaker.demo.util.ResponseSize;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ShoeService implements IShoeService{

    @Autowired
    private ShoeRepository shoeDAO;

    @Autowired
    private ShoppingCartRepository shoppingDAO;

    @Autowired
    private SizesRepository sizeDAO;

    @Autowired
    private ShoppingCartUserRepository suDAO;

    @Override
    public Response listaTopZapatillas(){
        Response response = new Response();
        Pageable topTen = PageRequest.of(0, 10);
        response.setData(shoeDAO.listaZapatillas(topTen));
        return response;
    }

    @Override
    public Shoe obtenerZapatilla(){
        return shoeDAO.findById(1L).get();
    }

    @Override
    public ResponseSize sizesShoes(Long id){
        ResponseSize response = new ResponseSize();
        response.setData(shoeDAO.listaSizeShoes(id));
        return response;
    }

    @Override
    public Shoe getShoe(long id){
        return shoeDAO.getById(id);
    }

    @Override
    public ShoppingCart getShoppingCart(long id){
        return shoppingDAO.getById(id);
    }

    @Override
    public Size getSize(long id){
        return sizeDAO.getById(id);
    }

    @Override
    public void setCartUser(ShoppingCartUser su){
        suDAO.save(su);
    }

}
