package com.fpoly.java5.service;

import com.fpoly.java5.entity.Item;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Service
@SessionScope
public class ShoppingCartService implements IShoppingCartService {
    Map<Integer, Item> map = new HashMap<>();
    Map<Integer, Item> db = Item.ITEM_DB;

    @Override
    public Item add(Integer id) {
        Item item = db.get(id);
        return map.merge(id, item, (k, v) -> {
            v.setQuantity(v.getQuantity() + 1);
            return v;
        });
    }

    @Override
    public Item update(Integer id, int qty) {
        return map.computeIfPresent(id, (k, v) -> {
            v.setQuantity(qty);
            return v;
        });
    }

    @Override
    public void remove(Integer id) {
        map.remove(id);
    }


    @Override
    public void clear() {
        map.clear();
    }

    @Override
    public Collection<Item> getItems() {
        return map.values();
    }

    @Override
    public int getCount() {
        return map.size();
    }

    @Override
    public double getAmount() {
        Function<Map.Entry<Integer, Item>, Double>
                getItemAmount = (entry) -> getAmount(entry);
        return map.entrySet()
                .stream()
                .map(getItemAmount)
                .reduce(Double::sum)
                .orElse(0d);
    }

    private double getAmount(Map.Entry<Integer, Item> entry) {
        Item item = entry.getValue();
        return item.getPrice() * item.getQuantity();
    }
}
