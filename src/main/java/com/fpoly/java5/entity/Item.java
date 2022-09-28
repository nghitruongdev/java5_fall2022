package com.fpoly.java5.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor
public class Item {
    int id;
    String name;
    double price;
    int quantity;
}
