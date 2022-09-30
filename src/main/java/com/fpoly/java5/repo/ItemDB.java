package com.fpoly.java5.repo;

import com.fpoly.java5.entity.Item;

import java.util.Map;

public class ItemDB {
    public static final Map<Integer, Item>ITEMS =Map.of(
            1, new Item(1, "Apple Iphone 13", 200, 1),
            2, new Item(2, "Apple Iphone 12", 200, 1),
            3, new Item(3, "Apple Iphone XS", 200, 1),
            4, new Item(4, "Apple Iphone 8 Plus", 200, 1),
            5, new Item(5, "Apple Iphone 7 Plus", 200, 1),
            6, new Item(6, "Apple Iphone 6 Plus", 200, 1)

    );
}
