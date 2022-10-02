package com.fpoly.java5.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.util.Map;

@Data
@NoArgsConstructor @AllArgsConstructor
public class Item implements Cloneable{
    int id;
    String name;
    double price;
    int quantity;
    String img;
    String desc;
    public static final Map<Integer, Item> ITEM_DB =Map.of(
            1, new Item(1, "Apple Iphone 13", 200, 10, "https://muabandienthoai24h.vn/storage/images/5ONFwcwNBd_1648459009.jpg", ""),
            2, new Item(2, "Apple Iphone 12", 200, 10,"https://muabandienthoai24h.vn/storage/images/5ONFwcwNBd_1648459009.jpg", ""),
            3, new Item(3, "Apple Iphone XS", 200, 10, "https://muabandienthoai24h.vn/storage/images/5ONFwcwNBd_1648459009.jpg", ""),
            4, new Item(4, "Apple Iphone 8 Plus", 200, 10, "https://muabandienthoai24h.vn/storage/images/5ONFwcwNBd_1648459009.jpg", ""),
            5, new Item(5, "Apple Iphone 7 Plus", 200, 10,"https://muabandienthoai24h.vn/storage/images/5ONFwcwNBd_1648459009.jpg", ""),
            6, new Item(6, "Apple Iphone 6 Plus", 200, 10,"https://muabandienthoai24h.vn/storage/images/5ONFwcwNBd_1648459009.jpg", ""),
            7, new Item(7, "Samsung Galaxy 22 Ultra", 200, 10,"https://muabandienthoai24h.vn/storage/images/5ONFwcwNBd_1648459009.jpg", "")
    );

    public String getDesc(){
        return "This is an " + name;
    }
    @Override
    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
