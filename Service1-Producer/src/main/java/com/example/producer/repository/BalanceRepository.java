/**
 * BalanceRepo
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.producer.repository;

import com.example.producer.model.Balance;
import com.example.producer.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface BalanceRepository extends JpaRepository<Balance, Long> {

    Optional<Balance> client(Client client);

}


