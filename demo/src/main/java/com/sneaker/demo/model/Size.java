package com.sneaker.demo.model;

import javax.persistence.*;

@Entity
@Table(name= "size")
public class Size {
    @Id
    @GeneratedValue
    @Column(name = "idSize")
    private long id;

    @Column(name = "talla")
    private Integer talla;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Integer getTalla() {
        return talla;
    }

    public void setTalla(Integer talla) {
        this.talla = talla;
    }
}
