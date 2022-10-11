package com.fpoly.java5.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Report {
    @Id
    Long id;
    Serializable group;
    Double sum;
    Long count;

    public Report(Serializable group, Double sum, Long count) {
        this.group = group;
        this.sum = sum;
        this.count = count;
    }
}
