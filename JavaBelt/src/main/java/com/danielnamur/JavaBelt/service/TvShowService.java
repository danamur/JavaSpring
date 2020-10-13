package com.danielnamur.JavaBelt.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.danielnamur.JavaBelt.models.TvShow;
import com.danielnamur.JavaBelt.repositories.TvShowRepository;

@Service
public class TvShowService {
	private final TvShowRepository tvShowRepo;
	
	public TvShowService(TvShowRepository tvShowRepo) {
		this.tvShowRepo = tvShowRepo;
	}
	
	public List<TvShow> allShows(){
		return tvShowRepo.findAll();
	}
	
	public TvShow createTvShow(TvShow tvshow) {
		return tvShowRepo.save(tvshow);
	}
	
	public TvShow findTvShow(Long id) {
		Optional<TvShow> optionalTvShow = tvShowRepo.findById(id);
		if(optionalTvShow.isPresent()) {
			return optionalTvShow.get();
		} else {
			return null;
		}
	}
	
	public TvShow updateTvShow(Long id, String title, String network) {
		Optional<TvShow> optionalTvShow = tvShowRepo.findById(id);
		if(optionalTvShow.isPresent()) {
			TvShow tvshow = optionalTvShow.get();
			tvshow.setTitle(title);
			tvshow.setNetwork(network);
			tvShowRepo.save(tvshow);
			return optionalTvShow.get();
		} else {
			return null;
		}
	}
	
	public void deleteTvShow(Long id) {
		Optional<TvShow> optionalTvShow = tvShowRepo.findById(id);
		if(optionalTvShow.isPresent()) {
			tvShowRepo.deleteById(id);
		}
	}
	
	public boolean authTvShow(String title) {
		TvShow tvshow = tvShowRepo.findByTitle(title);
		if(tvshow != null) {
			return false;
		} else {
			return true;
		}
	}
}