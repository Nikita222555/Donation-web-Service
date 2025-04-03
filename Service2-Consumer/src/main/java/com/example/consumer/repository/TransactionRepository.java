/**
 * TransactRepo
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.consumer.repository;

import com.example.consumer.model.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {}
