package com.shop.entities;

public class Baskets {

    private Long id;
    private Users user;
    private  Items item;

    public Baskets(){}
    public Baskets(Long id, Users user, Items item) {
        this.id = id;
        this.user = user;
        this.item = item;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Items getItem() {
        return item;
    }

    public void setItem(Items item) {
        this.item = item;
    }
}
