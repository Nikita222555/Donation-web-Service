/**
 * CheckRepo
 *
 * @author Tomilov
 * @version 1.0
 */
package com.example.producer.repository;

import com.example.producer.model.CheckPay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CheckPayment extends JpaRepository<CheckPay, Long> {

    @Query(value = "SELECT MAX(t.id) FROM transaction t", nativeQuery = true)
    Long getTransactionId();

    @Query(value = "SELECT t FROM transaction t ORDER BY t.id DESC", nativeQuery = true)
    List<CheckPayment> transactions();

}
