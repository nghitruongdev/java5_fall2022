package com.fpoly.java5.service;

import com.fpoly.java5.model.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;

@Service
@SessionScope
public class CartService {
    private final Map<String, Product> map = new HashMap<>();
    @Autowired
    ProductService service;

    public Product add(String id) {
        Product product = service.findById(id).orElseThrow();
        product.setQuantity(product.getQuantity() > 0 ? 1 : 0);
        return map.merge(id, product, (o1, o2) -> orderProduct(o1));
    }

    public Product remove(String id) {
        return map.remove(id);
    }

    private Product orderProduct(Product product) {
        product.setQuantity(product.getQuantity() + 1);
        return product;
    }

    public void clear() {
        map.clear();
    }

    public boolean contains(String id) {
        return map.containsKey(id);
    }

    public int getSize() {
        return map.size();
    }

    public int getCount() {
        return map.values().stream()
                .map(product -> product.getQuantity())
                .reduce(Integer::sum).orElse(0);
    }

    public Collection<Product> getList() {
        return map.values();
    }

//       Map<Integer, Item> map = new HashMap<>();
//    Map<Integer, Item> db = Item.ITEM_DB;
//
//    @SneakyThrows
//    @Override
//    public Item add(Integer id) {
//        Item item = db.get(id);
//        Item cartItem = (Item) item.clone();
//        cartItem.setQuantity(1);
//        return map.containsKey(id) ?
//                update(id, map.get(id).getQuantity() + 1) :
//                map.put(id, cartItem);
//    }
//
//    @Override
//    public Item update(Integer id, int qty) {
//        int stock = db.get(id).getQuantity();
//        if(qty <= 0)
//            throw new RuntimeException("Số lượng không hợp lệ!");
//        if (qty > stock)
//            throw new RuntimeException("Không đủ số lượng tồn kho!");
//
//        return map.computeIfPresent(id, (key, item) -> {
//            item.setQuantity(qty);
//            return item;
//        });
//    }
//
//    @Override
//    public void remove(Integer id) {
//        map.remove(id);
//    }
//
//
//    @Override
//    public void clear() {
//        map.clear();
//    }
//
//    @Override
//    public Collection<Item> getItems() {
//        return map.values();
//    }
//
//    @Override
//    public int getCount() {
//        return map.entrySet()
//                .stream()
//                .map(item -> item.getValue().getQuantity())
//                .reduce(Integer::sum).orElse(0);
//    }
//
//    @Override
//    public double getAmount() {
//        Function<Map.Entry<Integer, Item>, Double>
//                getItemAmount = (entry) -> getAmount(entry);
//        return map.entrySet()
//                .stream()
//                .map(getItemAmount)
//                .reduce(Double::sum)
//                .orElse(0d);
//    }
//
//    private double getAmount(Map.Entry<Integer, Item> entry) {
//        Item item = entry.getValue();
//        return item.getPrice() * item.getQuantity();
//    }
}
