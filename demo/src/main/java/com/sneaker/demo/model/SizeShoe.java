package com.sneaker.demo.model;

import javax.persistence.*;

@Entity
@Table(name= "sizeShoe")
public class SizeShoe {
    @Id
    @GeneratedValue
    @Column(name = "idSizeShoe")
    private long id;

    @ManyToOne
    @JoinColumn(name = "idSize")
    private Size size;

    @ManyToOne
    @JoinColumn(name = "idShoe")
    private Shoe shoe;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Shoe getShoe() {
        return shoe;
    }

    public void setShoe(Shoe shoe) {
        this.shoe = shoe;
    }
}
