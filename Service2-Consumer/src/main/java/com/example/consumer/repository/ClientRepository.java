/**
 * ClientRepo
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.consumer.repository;

import com.example.consumer.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {
    Client fullName(String fullName);
}
