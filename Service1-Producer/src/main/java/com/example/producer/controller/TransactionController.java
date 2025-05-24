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

import org.springframework.beans.factory.annotation.Autowired;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.example.producer.repository.BalanceRepository;
import com.example.producer.repository.ClientRepository;
import org.springframework.kafka.core.KafkaTemplate;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.example.producer.service.KafkaConsumer;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import com.example.producer.model.Transaction;
import org.springframework.http.HttpStatus;
import com.example.producer.model.Balance;
import com.example.producer.model.Client;
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
    private KafkaConsumer kafkaConsumer;


    @PostMapping("/open")
    public ResponseEntity<?> openTransaction(@RequestBody Transaction transaction) throws InterruptedException {
        try {
            // Поиск клиента в базе по имени
            Optional<Client> clientOptional = clientRepository.fullName(transaction.getName());

            if (!clientOptional.isPresent()) {
                return ResponseEntity.badRequest().body("--- NAME YOUR CLIENT NOT FOUND ---");
            }

            Client client = clientOptional.get();

            // Парсинг
            ObjectMapper mapper = new ObjectMapper();
            String jsonMessage = mapper.writeValueAsString(transaction);

            // Отправка Сервису-2
            kafkaTemplate.send("topic-1", jsonMessage);

            // Обновляем баланс в таблице balance
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

        } catch (JsonProcessingException e) {

            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("--- OPERATION FAILED ---");
        }

        // Получаем сообщение от Сервиса-2 (из темы topic-2)
        String response = KafkaConsumer.getMessage();
        System.out.println(response);
            if (response.equals("INSERTED")){
                return ResponseEntity.ok().body("--- PAYMENT HAS BEN CREDITED ---\n--- TRANSACTION-(Status : 200) --- ");
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("--- OPERATION FAILED ---");
            }


    }
}



