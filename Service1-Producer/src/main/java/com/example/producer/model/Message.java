/**
 * Data model
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.producer.model;

// Модель сообщения от Сервиса 2
public class Message {

    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
