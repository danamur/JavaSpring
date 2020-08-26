package com.codingdojo.world.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.world.models.Country;
import com.codingdojo.world.models.Language;
import com.codingdojo.world.repository.CityRepository;
import com.codingdojo.world.repository.CountryRepository;
import com.codingdojo.world.repository.LanguageRepository;

@Service
public class ApiService {
	private final CountryRepository countryRepo;
	private final LanguageRepository languageRepo;
	private final CityRepository cityRepo;
	
	public ApiService(CountryRepository countryRepo,
						LanguageRepository languageRepo,
						CityRepository cityRepo) {
		
		this.countryRepo = countryRepo;
		this.languageRepo = languageRepo;
		this.cityRepo = cityRepo;
	}
	
    public List<Object[]> question1() {
        List<Object[]> table = countryRepo.joinAllCountriesSlovene();
        return table;
    }
    
    public List<Object[]> question2(){
    	List<Object[]> table = countryRepo.findAllCountriesTotalCities();
    	return table;
    }
    
    public List<Object[]> question3(){
    	List<Object[]> table = cityRepo.findCitiesMexicoPopulation();
    	return table;
    }
    
    public List<Object[]> question4(){
    	List<Object[]> table = languageRepo.findAllCountriesLanguegePercentage();
    	return table;
    }
    
    public List<Object[]> question5(){
    	List<Object[]> table = countryRepo.findallCountriesSurfaceArea500();
    	return table;
    }
    
    public List<Object[]> question6(){
    	List<Object[]> table = countryRepo.findAllCountriesGovermentFormMonarchy();
    	return table;
    }
    
    public List<Object[]> question7(){
    	List<Object[]> table = cityRepo.findCitiesInDistrictBuenosAires();
    	return table;
    }
    
    public List<Object[]> question8(){
    	List<Object[]> table = countryRepo.findAllCountCitiesForRegion();
    	return table;
    }
	
}
