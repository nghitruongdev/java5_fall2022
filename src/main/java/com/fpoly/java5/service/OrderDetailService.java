package com.fpoly.java5.service;

import com.fpoly.java5.repo.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailService {

    @Autowired
    OrderDetailRepository repo;


}
