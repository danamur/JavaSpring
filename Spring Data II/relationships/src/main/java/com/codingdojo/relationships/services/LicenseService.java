package com.codingdojo.relationships.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.relationships.models.License;
import com.codingdojo.relationships.repositories.LicenseRepository;

@Service
public class LicenseService {
	private final LicenseRepository licenseRepository;
	
	public LicenseService(LicenseRepository licenseRepository) {
		this.licenseRepository = licenseRepository;
	}
	
	public License addLicense(License license) {
		return licenseRepository.save(license);
	}
	
	public Optional<License> getLicense(Long id) {
		return licenseRepository.findById(id);
	}
	
	//Constructor numero de licencia
	
	public static int licenseNumber;

	public static int getLicenseNumber() {
		return licenseNumber;
	}
	
	//setter Numero de Licencia

	public static void setLicenseNumber(int licenseNumber) {
		LicenseService.licenseNumber = licenseNumber;
	}
	
	//metodo para convertir numero de licencia en String

	public String generateLicenseNumber() {
		if(licenseRepository.findTopByOrderByNumberDesc().isEmpty()) {
			licenseNumber +=1;
			return stringLicenseNumber(licenseNumber);
		}
		else {
			List<License> top = licenseRepository.findTopByOrderByNumberDesc() ;
			licenseNumber = 1+(Integer.parseInt(top.get(0).getNumber()));
			return stringLicenseNumber(licenseNumber);
		}
	}
	
	public String stringLicenseNumber(int num) {
		String format = String.format("%06d", num);
		return format;
	}
	
}
