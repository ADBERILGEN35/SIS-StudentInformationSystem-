package com.ube.sis.entity;

import com.ube.sis.model.EStudentType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "student_type")
public class StudentType {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  @Enumerated(EnumType.STRING)
  @Column(length = 20)
  private EStudentType name;

  public StudentType() {

  }

  public StudentType(EStudentType name) {
    this.name = name;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public EStudentType getName() {
    return name;
  }

  public void setName(EStudentType name) {
    this.name = name;
  }
}

