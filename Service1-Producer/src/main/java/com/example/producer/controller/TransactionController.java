/**
 * Controller class
 * Receiving a request
 * Data update logic
 * Sending a response to the user
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.producer.controller;

import com.example.producer.model.Balance;
import com.example.producer.model.CheckPay;
import com.example.producer.model.Client;
import com.example.producer.model.Transaction;
import com.example.producer.repository.BalanceRepository;
import com.example.producer.repository.CheckPayment;
import com.example.producer.repository.ClientRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/v1")
public class TransactionController {

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private BalanceRepository balanceRepository;

    @Autowired
    private CheckPayment checkPayment;

    private Long transactionId;

    @PostMapping("/open")
    public ResponseEntity<?> openTransaction(@RequestBody Transaction transaction) {
        try {
            // Search client
            Optional<Client> clientOptional = clientRepository.fullName(transaction.getName());

            if (!clientOptional.isPresent()) {
                return ResponseEntity.badRequest().body("--- NAME YOUR CLIENT NOT FOUND ---");
            }

            Client client = clientOptional.get();

            // JSON.Stringify
            ObjectMapper mapper = new ObjectMapper();
            String jsonMessage = mapper.writeValueAsString(transaction);

            // Send to KAFKA
            kafkaTemplate.send("topic-1", jsonMessage);

            // Logic for UPDATING balance
            Optional<Balance> balanceOptional = balanceRepository.client(client);

            if (balanceOptional.isPresent()) {
                Balance balance = balanceOptional.get();
                // Checking for NULL in column sum (in table "balance")
                double currentAmount = balance.getAmount() != null ? balance.getAmount() : 0D;
                balance.setAmount(currentAmount + transaction.getAmount());
                balanceRepository.save(balance);
            } else {
                Balance newBalance = new Balance();
                newBalance.setClient(client);
                newBalance.setAmount(transaction.getAmount());
                balanceRepository.save(newBalance);
            }

            // Checking INSERTION (transaction)
            Long currentTransactId = checkPayment.getTransactionId();

            if (transactionId == null || currentTransactId > transactionId) {
                transactionId = currentTransactId;
                return ResponseEntity.ok().body("--- PAYMENT HAS BEN CREDITED ---\n--- TRANSACTION-(Status : 200) --- ");
            } else {
                return ResponseEntity.badRequest().body("--- NO NEW TRANSACTIONS ---");
            }



        } catch (JsonProcessingException e) {

            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("--- OPERATION FAILED ---");

        }
    }
}



