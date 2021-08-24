package com.sneaker.demo.util;

import com.sneaker.demo.model.Shoe;

import java.util.List;

public class Response {
    private List<Shoe> data;

    public List<Shoe> getData() {
        return data;
    }

    public void setData(List<Shoe> data) {
        this.data = data;
    }
}
