package com.codingdojo.dojosninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.dojosninjas.models.Dojo;
import com.codingdojo.dojosninjas.models.Ninja;
import com.codingdojo.dojosninjas.repository.DojoRepository;
import com.codingdojo.dojosninjas.repository.NinjaRepository;

@Service
public class DNService {
	private final DojoRepository dojoRepository;
	private final NinjaRepository ninjaRepository;
	
	//Getter and setter the service
	public DNService(DojoRepository dojoRepository,
						NinjaRepository ninjaRepository) {
		this.dojoRepository = dojoRepository;
		this.ninjaRepository = ninjaRepository;
	}
	
	public void addDojo(Dojo dojo) {
		dojoRepository.save(dojo);
	}
	
	public void addNinja(Ninja ninja) {
		ninjaRepository.save(ninja);
	}
	
	
	public List<Dojo> getAllDojos(){
		return dojoRepository.findAll();
	}
	
	//end getter and setter
	
	public Dojo dojoSingle(Long id) {
		Optional<Dojo> dojo = dojoRepository.findById(id);
		if(dojo.isPresent()) {
			return dojo.get();
		}
		else {
			return null;
		}
	}
	
}
