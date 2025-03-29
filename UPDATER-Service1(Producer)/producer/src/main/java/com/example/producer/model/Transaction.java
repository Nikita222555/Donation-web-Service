/**
 * Data model
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.producer.model;

public class Transaction {
    private String name;
    private double amount;

    public Transaction(String name, double amount){
        this.name = name;
        this.amount = amount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
}
