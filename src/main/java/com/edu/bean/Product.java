package com.edu.bean;

import java.math.BigDecimal;
import java.util.Date;

public class Product {
    private String id;
    private String title; // 它的值是10 到20 个字符
    private BigDecimal price;
    private String descs;
    private String img;
    private Date shelftime;

    private Integer isshelf;

    private Integer iscount;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs == null ? null : descs.trim();
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public Date getShelftime() {
        return shelftime;
    }

    public void setShelftime(Date shelftime) {
        this.shelftime = shelftime;
    }

    public Integer getIsshelf() {
        return isshelf;
    }

    public void setIsshelf(Integer isshelf) {
        this.isshelf = isshelf;
    }

    public Integer getIscount() {
        return iscount;
    }

    public void setIscount(Integer iscount) {
        this.iscount = iscount;
    }
}