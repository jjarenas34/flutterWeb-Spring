package com.sneaker.demo.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name= "shoe")
public class Shoe {
    @Id
    @GeneratedValue
    @Column(name = "idShoe")
    private long id;

    @Column(name = "marca")
    private String itemName;

    @Column(name = "modelo")
    private String itemModel;

    @Column(name = "precio")
    private Double itemPrice;

    @Column(name = "imagen")
    private String itemImage;

    @Column(name = "lanzamiento")
    private Date lanzamiento;

    @Column(name = "rating")
    private int rating;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMarca() {
        return itemName;
    }

    public void setMarca(String marca) {
        this.itemName = marca;
    }

    public String getModelo() {
        return itemModel;
    }

    public void setModelo(String modelo) {
        this.itemModel = modelo;
    }

    public Double getPrecio() {
        return itemPrice;
    }

    public void setPrecio(Double precio) {
        this.itemPrice = precio;
    }

    public String getImagen() {
        return itemImage;
    }

    public void setImagen(String imagen) {
        this.itemImage = imagen;
    }

    public Date getLanzamiento() {
        return lanzamiento;
    }

    public void setLanzamiento(Date lanzamiento) {
        this.lanzamiento = lanzamiento;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}