package com.sneaker.demo.model;

import javax.persistence.*;

@Entity
@Table(name= "shoppingCart")
public class ShoppingCart {
    @Id
    @GeneratedValue
    @Column(name = "idShoppingCart")
    private long id;

    @Column(name = "Cliente")
    private String cliente;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }
}
