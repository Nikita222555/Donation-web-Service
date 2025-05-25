/**
 * Service
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.consumer.service;

import org.springframework.beans.factory.annotation.Autowired;
import com.example.consumer.repository.TransactionRepository;
import org.springframework.kafka.annotation.KafkaListener;
import com.example.consumer.repository.ClientRepository;
import org.springframework.kafka.core.KafkaTemplate;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;
import com.example.consumer.model.Transaction;
import com.example.consumer.model.Client;
import com.example.consumer.model.Donat;
import java.io.IOException;

@Service
public class TransactionService {

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    @KafkaListener(topics = "topic-1", groupId = "myGroup")
    public void consumeMessage(String message) throws IOException {

        ObjectMapper objectMapper = new ObjectMapper();
        Donat transactionMessage = objectMapper.readValue(message, Donat.class);

        Client client = clientRepository.fullName(transactionMessage.getName());

        if (client != null) {
            // Делаем инсерт в transaction
            Transaction transaction = new Transaction();
            transaction.setClient(client);
            transaction.setAmount(transactionMessage.getAmount());
            transaction.setClientAcc(client.getAccount()); // client_account = transaction.client_acc
            transactionRepository.save(transaction);
            // Отправляем в Кафку Сервису-1
            kafkaTemplate.send("topic-2", "INSERTED");
        } else {
            kafkaTemplate.send("topic-2", "FAILED TRANSACTION");
        }
    }
}
