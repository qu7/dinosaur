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
	  
	public void petAction() {
		if (this.happy <= 3) {
			this.happy++;
			this.status = "That made him feel better!";
			} else if (this.disc <= 8) {
			this.happy++;
			this.status = "He liked that!";
		} else if (this.happy >= 10){
			this.disc --;
			this.happy = 10;
			this.status = "He's acting very proud!";
		} else {
			this.happy++;
			this.status = "He liked that!";
		}
	}
	
	public void feedAction() {
		this.food--;
		this.hunger--;
		if (hunger < 5) {
			this.status = "He looks full!";
			this.happy++;
		} else if (hunger > 8) {
			this.status = "He's still pretty hungry!";
		} else if (hunger > 12) {
			this.status = "He's starving!";
		} else {
			this.status = "He's not as hungry now!";
			this.happy++;
		}
	}
	
	public void talkAction() {
		this.hunger++;
		if (this.happy < 4) {
			this.disc++;
			this.status = "He did not have a good training session...";
		} else if (this.happy > 4 && this.happy <= 10) {
			this.disc = this.disc+2;
			this.status = "He had a good workout!";
		} else {
			this.disc = this.disc+3;
			this.hunger++;
			this.status = "He had a great workout!";
		}
	}
	
	public void checkStats() {
		if (this.hunger < 0) {
			this.happy--;
			this.disc--;
			this.hunger = 0;
		}
		if (this.food < 0) {
			this.food = 0;
		}
		if (this.disc < 0) {
			this.disc = 0;
		}
		if (this.happy > 20) {
			this.happy = 20;
		}
	}
	
}
