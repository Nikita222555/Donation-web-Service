/**
 * Data model
 *
 * @author Tomilov
 * @version 1.0
 */
package com.example.producer.model;

import jakarta.persistence.*;

@Entity
@Table(name = "transaction")
public class CheckPay {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


}
