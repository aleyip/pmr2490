package com.pmr2490.service;

import java.util.List;

import com.pmr2490.model.Profession;

public interface ProfessionService {

	public List<Profession> getAll();
	
	public Profession get(int id);
	
	public void delete(int id);
	
	public int create(String name);
	
	public void update(int id, String name);
	
}