package com.codingdojo.world.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.world.models.Country;

@Repository
public interface CountryRepository extends CrudRepository<Country, Long>{

	//Ejercicio 1
    @Query(value="SELECT countries.name, languages.language, languages.percentage "
    		+ "FROM countries JOIN languages ON countries.id = languages.country_id "
    		+ "WHERE language = 'Slovene' ORDER BY languages.percentage DESC", nativeQuery=true)
    List<Object[]> joinAllCountriesSlovene();
    
    //Ejercicio 2
    @Query(value="SELECT countries.name, COUNT(cities.id) AS num_cities "
    		+ "FROM countries JOIN cities ON countries.id = cities.country_id "
    		+ "GROUP BY countries.id ORDER BY num_cities DESC", nativeQuery = true)
    List<Object[]> findAllCountriesTotalCities();
    
    //Ejercicio 5
    @Query(value="SELECT countries.name, countries.surface_area, countries.population "
    		+ "FROM countries "
    		+ "WHERE countries.surface_area < 501 AND countries.population > 100000 "
    		+ "ORDER BY countries.surface_area DESC", nativeQuery = true)
    List<Object[]> findallCountriesSurfaceArea500();
    
    //Ejercicio 6
    @Query(value="SELECT countries.name, countries.government_form, countries.surface_area, countries.life_expectancy "
    		+ "FROM countries "
    		+ "WHERE countries.government_form = 'Monarchy' "
    		+ "ORDER BY countries.surface_area DESC", nativeQuery = true)
    List<Object[]> findAllCountriesGovermentFormMonarchy();

	//Ejercicio 8
	@Query(value = "SELECT countries.region, COUNT(countries.id) AS num_countries "
			+ "FROM countries GROUP BY countries.region "
			+ "ORDER BY num_countries DESC", nativeQuery = true)
	List<Object[]> findAllCountCitiesForRegion();
}


