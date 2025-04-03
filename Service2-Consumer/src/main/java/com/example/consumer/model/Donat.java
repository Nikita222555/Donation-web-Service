/**
 * Data model
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.consumer.model;

public class Donat {
    private String name;
    private Double amount;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }
}