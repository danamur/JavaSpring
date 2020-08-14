package com.codingdojo.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.lookify.models.Lookify;
import com.codingdojo.lookify.repositories.LookifyRepository;

@Service
public class LookifyService {
	
	//Agregar el Lookify al repositorio como una dependencia
	private final LookifyRepository lookifyRepository;
	
	public LookifyService(LookifyRepository lookifyRepository) {
		this.lookifyRepository = lookifyRepository;
	}
	
	//Devolciendo todos los Song
	public List<Lookify> allLookify(){
		return lookifyRepository.findAll();
	}
	
	//Buscar cancion
	public Lookify findLookify(Long id) {
		Optional<Lookify> optionalLookify = lookifyRepository.findById(id);
		if(optionalLookify.isPresent()) {
			return optionalLookify.get();
		}
		else {
			return null;
		}
	}
	
	//Agregar cancion
	public Lookify addLookify(Lookify melody) {
		return lookifyRepository.save(melody);
	}
	
	//Eliminar Cancion
	public void deleteLookify(Long id) {
		lookifyRepository.deleteById(id);
	}
	
	//Top 10 de canciones
	public List<Lookify> getToTen(){
		return lookifyRepository.findTop10ByOrderByRatingDesc();
	}
	
	//Buscar cancion
	public List<Lookify> getSearchLookify(String artist){
		return lookifyRepository.findByArtist(artist);
	}
}
