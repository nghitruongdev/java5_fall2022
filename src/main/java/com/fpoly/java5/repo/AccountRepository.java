package com.fpoly.java5.repo;

import com.fpoly.java5.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, String> {
}
