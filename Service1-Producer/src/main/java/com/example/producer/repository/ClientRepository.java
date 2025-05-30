/**
 * ClientRepo
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.producer.repository;

import com.example.producer.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {

    Optional<Client> fullName(String fullName);

}
