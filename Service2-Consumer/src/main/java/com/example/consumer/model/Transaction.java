/**
 * Data model
 *
 * @author Tomilov
 * @version 1.0
 */

package com.example.consumer.model;

import jakarta.persistence.*;

@Entity
@Table(name = "transaction")
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_id")
    private Client client;

    @Column(name = "amount")
    private Double amount;

    @Column(name = "client_acc")
    private String clientAcc;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getClientAcc() {
        return clientAcc;
    }

    public void setClientAcc(String clientAcc) {
        this.clientAcc = clientAcc;
    }
}
