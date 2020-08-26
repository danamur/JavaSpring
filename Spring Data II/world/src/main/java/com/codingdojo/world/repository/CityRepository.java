package com.codingdojo.world.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.world.models.City;

@Repository
public interface CityRepository extends CrudRepository<City,Long> {
	
	//Ejercicio 3
	@Query(value="SELECT cities.name, cities.population "
				+ "FROM cities JOIN countries "
				+ "WHERE countries.name = 'Mexico' AND cities.population "
				+ "ORDER BY cities.population DESC", nativeQuery = true)
	List<Object[]> findCitiesMexicoPopulation();

	//Ejercicio 7
	@Query(value="SELECT cities.name AS city_name, countries.name AS country_name, cities.district, cities.population "
			+ "FROM cities JOIN countries ON countries.id = cities.country_id "
			+ "WHERE cities.district = 'Buenos Aires' AND cities.population > 500000", nativeQuery = true)
	List<Object[]> findCitiesInDistrictBuenosAires();

}
