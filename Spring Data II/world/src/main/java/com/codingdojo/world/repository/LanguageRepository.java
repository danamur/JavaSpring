package com.codingdojo.world.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.world.models.Language;

@Repository
public interface LanguageRepository extends CrudRepository<Language,Long> {

	//Ejercicio 4
	@Query(value="SELECT countries.name, languages.language, languages.percentage "
			+ "FROM languages JOIN countries ON countries.id = languages.country_id "
			+ "WHERE languages.percentage > 89 ORDER BY languages.percentage DESC", nativeQuery = true)
	List<Object[]> findAllCountriesLanguegePercentage();
}
