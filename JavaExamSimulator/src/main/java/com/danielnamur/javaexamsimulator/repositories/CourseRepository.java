package com.danielnamur.javaexamsimulator.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.danielnamur.javaexamsimulator.models.Course;

@Repository
public interface CourseRepository extends CrudRepository<Course, Long> {
	List<Course> findAll();
	Course findByName(String name);

}
