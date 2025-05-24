/**
 * Service
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.producer.service;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

@Service
public class KafkaConsumer {

    // Очередь
    private static final BlockingQueue<String> messageQueue = new LinkedBlockingQueue<>();

    @KafkaListener(topics = "topic-2", groupId = "myGroup")
    public void onMessage(ConsumerRecord<?, ?> record) {
        String message = record.value().toString();
        messageQueue.offer(message);
    }

    public static String getMessage() throws InterruptedException {
        return messageQueue.take();
    }

}
