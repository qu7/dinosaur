package com.example.dinosaur;

public class Dinosaur {

	private int food;
	private int hunger;
	private int happy;
	private int disc;
	private String status;

	  public int getFood() {
	    return food;
	  }

	  public void setFood(int newFood) {
	    this.food = newFood;
	  }

	  public int getHunger() {
		return hunger;
	  }

	  public void setHunger(int newHunger) {
	    this.hunger = newHunger;
	  }
	
	  public int getDisc() {
		return disc;
	  }

	  public void setDisc(int newDisc) {
	    this.disc = newDisc;
	  }
	  
	  public int getHappy() {
		return happy;
	  }

	  public void setHappy(int newHappy) {
	    this.happy = newHappy;
	  }
	  
	  public String getStatus() {
		return status;
	  }

	  public void setStatus(String newStatus) {
	    this.status = newStatus;
	  }
	
	// actions
	public static Dinosaur createNewDinosaur() {
		Dinosaur dinosaur = new Dinosaur();
		dinosaur.setDisc(5);
		dinosaur.setFood(3);
		dinosaur.setHunger(5);
		dinosaur.setHappy(5);
		dinosaur.setStatus("");
		return dinosaur;
	}
	
	// override default toString
	public String toString() { 
		String dinosaurString = "DINOSAUR: " + this.getStatus() + "happiness: " + this.getHappy() + " | hunger: " + this.getHunger() +
			" | discipline: " + this.getDisc() + "" + " | food: " + this.getFood();
		return dinosaurString;
	}
	  
	public String petAction() {
		if (this.happy <= 3) {
			this.happy++;
			return ("He feels much better.");
		} else if (this.disc <= 8) {
			this.happy++;
			return ("He seems really happy.");
		} else if (this.happy >= 10){
			this.disc --;
			this.happy = 10;
			return ("He is overjoyed.");
		} else {
			this.happy++;
			return ("He liked that.");
		}
	}
	
	public String feedAction() {
		this.food--;
		return("He thought that was delicious!");
	}
	
	public String workoutAction() {
		this.disc++;
		this.hunger++;
		return("That was a good workout!");
	}
}
