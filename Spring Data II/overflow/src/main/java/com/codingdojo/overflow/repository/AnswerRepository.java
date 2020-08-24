package com.codingdojo.overflow.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.overflow.models.Answer;

@Repository
public interface AnswerRepository extends CrudRepository <Answer, Long> {

}