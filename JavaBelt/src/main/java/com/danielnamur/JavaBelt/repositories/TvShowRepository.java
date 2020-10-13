package com.danielnamur.JavaBelt.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.danielnamur.JavaBelt.models.TvShow;

@Repository
public interface TvShowRepository extends CrudRepository<TvShow, Long> {
	List<TvShow> findAll();
	TvShow findByTitle(String title);
}