/**
 * Service
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.consumer.service;

import com.example.consumer.model.Client;
import com.example.consumer.model.Donat;
import com.example.consumer.model.Transaction;
import com.example.consumer.repository.ClientRepository;
import com.example.consumer.repository.TransactionRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

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
            Transaction transaction = new Transaction();
            transaction.setClient(client);
            transaction.setAmount(transactionMessage.getAmount());
            transaction.setClientAcc(client.getAccount()); // client_account = transaction.client_acc

            transactionRepository.save(transaction);
            //System.out.println(" --- SUCCESSFUL ---");
            kafkaTemplate.send("topic-2", "INSERTED");
        } else {
            //System.out.println(" --- INSERT ERROR --- ");
            kafkaTemplate.send("topic-2", "NOT INSERTED");
        }
    }
}
