package com.pmr2490.service;

import java.util.Date;
import java.util.List;

import com.pmr2490.model.Event;
import com.pmr2490.model.Local;
import com.pmr2490.model.Tag;
import com.pmr2490.model.User;

public interface EventService {

	public List<Event> getAll();
	
	public Event get(int id);
	
	public void delete(int id);
	
	public int create(String name, Date startDate, Date endDate, String email, Integer phoneDDD, 
			String phoneNumber, String description, User creator, Local local, List<Tag> tags);
	
	public void update(int id, String name, Date startDate, Date endDate, String email, Integer phoneDDD, 
			String phoneNumber, String description, Local local, List<Tag> tags);
	
}
