package com.fpoly.java5.repo;

import com.fpoly.java5.entity.Item;

import java.util.Map;

public class ItemDB {
    public static final Map<Integer, Item>ITEMS =Map.of(
            1, new Item(),
            2, new Item(),
            3, new Item(),
            4, new Item(),
            5, new Item(),
            6, new Item()
    );
}
