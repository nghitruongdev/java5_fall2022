package com.fpoly.java5.filter;

import com.fpoly.java5.entity.Item;
import com.fpoly.java5.service.SessionService;
import com.fpoly.java5.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import java.io.IOException;

@WebFilter(urlPatterns = "/*")
public class ItemFilter extends HttpFilter {
    @Autowired
    SessionService sessionService;
    @Autowired
    ShoppingCartService cart;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        sessionService.add("items", Item.ITEM_DB.values());
        sessionService.add("cart", cart);
        chain.doFilter(request, response);
    }
}
