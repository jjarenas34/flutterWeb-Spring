package com.sneaker.demo.model;

import javax.persistence.*;

@Entity
@Table(name= "shoppingCartUser")
public class ShoppingCartUser {
    @Id
    @GeneratedValue
    @Column(name = "idShoppingCartUser")
    private long id;

    @ManyToOne
    @JoinColumn(name = "idShoe")
    private
    Shoe shoe;

    @ManyToOne
    @JoinColumn(name = "idShopping")
    private
    ShoppingCart shoppingCart;

    @ManyToOne
    @JoinColumn(name = "idSize")
    private Size talla;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Shoe getShoe() {
        return shoe;
    }

    public void setShoe(Shoe shoe) {
        this.shoe = shoe;
    }

    public ShoppingCart getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(ShoppingCart shoppingCart) {
        this.shoppingCart = shoppingCart;
    }

    public Size getTalla() {
        return talla;
    }

    public void setTalla(Size talla) {
        this.talla = talla;
    }
}
