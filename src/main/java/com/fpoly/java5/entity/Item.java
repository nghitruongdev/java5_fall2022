package com.fpoly.java5.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@NoArgsConstructor @AllArgsConstructor
public class Item {
    int id;
    String name;
    double price;
    int quantity;

    public static final Map<Integer, Item> ITEM_DB =Map.of(
            1, new Item(1, "Apple Iphone 13", 200, 10),
            2, new Item(2, "Apple Iphone 12", 200, 10),
            3, new Item(3, "Apple Iphone XS", 200, 10),
            4, new Item(4, "Apple Iphone 8 Plus", 200, 10),
            5, new Item(5, "Apple Iphone 7 Plus", 200, 10),
            6, new Item(6, "Apple Iphone 6 Plus", 200, 10)
    );
}
