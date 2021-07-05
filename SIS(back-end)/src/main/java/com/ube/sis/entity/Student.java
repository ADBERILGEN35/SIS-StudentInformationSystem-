package com.ube.sis.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

import lombok.Data;

@Entity(name = "student")
@Data
public class Student {
    @Id
    @Column(name = "student_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long studentId;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "counselor")
    private User counselor;

    @Column(name = "graduated")
    private boolean isGraduated;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "student_types", joinColumns = @JoinColumn(name = "student_id"), inverseJoinColumns = @JoinColumn(name = "type_id"))
    private Set<StudentType> roles = new HashSet<>();
}
