package com.example.dinosaur.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.example.dinosaur.Dinosaur;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;

@RestController
@EnableAutoConfiguration(exclude = {ErrorMvcAutoConfiguration.class})
public class MainController {
	Dinosaur dinosaur = new Dinosaur();

	@GetMapping("/")
	// welcome the user to the game. Set the base stats here.
	public ModelAndView welcome() {
		ModelAndView mav;
		try {
	        mav = new ModelAndView("index.jsp");
	    } catch(IndexOutOfBoundsException e) {
	    	mav = handleException();
	    }
	    return mav;
	}
	
	@GetMapping("/generateNewDino")
	public Dinosaur generateNewDino() {
		dinosaur = dinosaur.createNewDinosaur();
		return dinosaur;
	}
	
	@GetMapping("/pet")
	public Dinosaur pet() {
		dinosaur.petAction();
		return dinosaur;
	}
	
	@GetMapping("/feed")
	public Dinosaur feed() {
		dinosaur.feedAction();
		return dinosaur;
	}
	
	@GetMapping("/workout")
	public Dinosaur workout() {
		dinosaur.workoutAction();
		return dinosaur;
	}
	
	private void generateException(){
	    throw new IndexOutOfBoundsException();      
	}

	private ModelAndView handleException(){
	     return new ModelAndView("error.jsp");
	}
	
}
