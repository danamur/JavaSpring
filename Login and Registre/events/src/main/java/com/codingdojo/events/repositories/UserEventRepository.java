package com.codingdojo.events.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.events.models.UserEvent;

@Repository
public interface UserEventRepository extends CrudRepository<UserEvent, Long> {

}
