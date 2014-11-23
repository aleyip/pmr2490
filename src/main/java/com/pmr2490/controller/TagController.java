package com.pmr2490.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pmr2490.service.TagService;

@Controller
@RequestMapping(value="/tags")
public class TagController {

	private TagService tagService;
	
	@Autowired
	public TagController(TagService tagService) {
		this.tagService = tagService;
	}
	
	@RequestMapping(value="")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		try {
			ModelAndView modelAndView = new ModelAndView("tag/index");
			modelAndView.addObject("tags", this.tagService.getAll());
			return modelAndView;
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("error/unexpected-error");
		}
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public void create(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String name) {
		try {
			this.tagService.create(name);
			response.sendRedirect("/pmr2490/tags");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/{id}")
	public ModelAndView show(@PathVariable int id) {
		try {
			ModelAndView modelAndView = new ModelAndView("tag/show");
			modelAndView.addObject("tag", this.tagService.get(id));
			return modelAndView;
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("error/unexpected-error");
		}
	}
	
	@RequestMapping(value="/{id}/destroy", method=RequestMethod.POST)
	public void destroy(HttpServletRequest request, HttpServletResponse response, @PathVariable int id) {
		try {
			this.tagService.delete(id);
			response.sendRedirect("/pmr2490/tags");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/{id}/edit")
	public ModelAndView edit(@PathVariable int id) {
		try {
			ModelAndView modelAndView = new ModelAndView("tag/edit");
			modelAndView.addObject("tag", this.tagService.get(id));
			return modelAndView;
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("error/unexpected-error");
		}
	}
	
	@RequestMapping(value="/{id}/update", method=RequestMethod.POST)
	public void update(HttpServletRequest request, HttpServletResponse response, 
			@PathVariable int id,
			@RequestParam("name") String name) {
		try {
			this.tagService.update(id, name);
			response.sendRedirect("/pmr2490/tags");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
