package com.danielnamur.JavaBelt.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.danielnamur.JavaBelt.models.Rating;
import com.danielnamur.JavaBelt.repositories.RatingRepository;

@Service
public class RatingService {
	private final RatingRepository ratingRepo;
	
	public RatingService(RatingRepository ratingRepo) {
		this.ratingRepo = ratingRepo;
	}
	
	public List<Rating> allRatings(){
		return ratingRepo.findAll();
	}
	
	public Rating createRating(Rating rating) {
		return ratingRepo.save(rating);
	}
	
	public Rating findRating(Long id) {
		Optional<Rating> optionalRating = ratingRepo.findById(id);
		if(optionalRating.isPresent()) {
			return optionalRating.get();
		} else {
			return null;
		}
	}

}