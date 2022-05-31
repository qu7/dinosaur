<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.example.dinosaur.controller.MainController" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Dinosaur Game</title>
	</head>
	<body>
		<script type='text/javascript'>
			if (typeof java === 'undefined') {
			    document.write("Java is not installed for this browser.");
			} else {
			    document.write("java.version " + java.lang.System.getProperty("java.version"));
			}
		</script>
	
		<center>		
			<p>Dinosaur Game</p>
		</center>
		
		<center>		
			<canvas id="myCanvas" width="600" height="400" style="border:1px solid #000000;">
			</canvas>
			<p id="currentLine"></p>
			<label id="status"></label>
		</center>
		
		<center>
			<button id="pet" onclick="performPet()">Pet</button> 
			<button id="feed" onclick="performFeed()">Feed</button> 
			<button id="workout" onclick="performWorkout()">Workout</button> 
		</center>
		
		<center>
			<p>Stats:</p>
		</center>
		
		<center>
			<label>Food: </label>	<label id="food"></label>	<br>
			<label>Happiness: </label>	<label id="happy"></label>	<br>
			<label>Hunger: </label>	<label id="hunger"></label>	<br>
			<label>Discipline: </label>	<label id="disc"></label>	<br>
		</center>
	</body>

	<!-- JS for canvas panel -->
	<script>
	var newLine;	
	
	window.onload = function() {
		var canvas = document.getElementById("myCanvas");
		var ctx = canvas.getContext("2d");
	  	var bg = document.getElementById("bg1");
	  	ctx.drawImage(bg, 0, 0);
	  	generateNewDino();	  	
	  	updateImage();
	};
	
	function updateImage(){
	};
	
	updateScript = function(newLine){
		document.getElementById("currentLine").innerHTML = newLine;
	};
	
	generateNewDino = function(){
		 $.ajax({
	           type: 'GET',
	           url: '/generateNewDino',               
	           success: function(data) {                               
	                    updateStats(data);
	           },
	           error: function(jqXHR, textStatus, errorThrown) {
	               console.log(jqXHR +' : '+ textStatus +' : '+ errorThrown);             
	           }
	       });         
	}
	
	function performPet(){
		var newLine = "You petted the dinosaur";
		updateScript(newLine);
		 $.ajax({
	           type: 'GET',
	           url: '/pet',               
	           success: function(data) {                               
	                    updateStats(data);
	           },
	           error: function(jqXHR, textStatus, errorThrown) {
	               console.log(jqXHR +' : '+ textStatus +' : '+ errorThrown);             
	           }
	       });         
	}
	
	function performFeed(){
		var newLine = "The dinosaur is ready to eat!";
		updateScript(newLine);
		 $.ajax({
	           type: 'GET',
	           url: '/feed',               
	           success: function(data) {                               
	                    updateStats(data);
	           },
	           error: function(jqXHR, textStatus, errorThrown) {
	               console.log(jqXHR +' : '+ textStatus +' : '+ errorThrown);             
	           }
	       });         
	}
	
	function performWorkout(){
		var newLine = "The dinosaur wants to workout!";
		updateScript(newLine);
		 $.ajax({
	           type: 'GET',
	           url: '/workout',               
	           success: function(data) {                               
	                    updateStats(data);
	           },
	           error: function(jqXHR, textStatus, errorThrown) {
	               console.log(jqXHR +' : '+ textStatus +' : '+ errorThrown);             
	           }
	       });         
	}
	
	// updates stats fields
	updateStats = function(dinosaurData){
		document.getElementById("status").innerHTML = dinosaurData.status;
		document.getElementById("food").innerHTML = dinosaurData.food;
		document.getElementById("happy").innerHTML = dinosaurData.happy;
		document.getElementById("hunger").innerHTML = dinosaurData.hunger;
		document.getElementById("disc").innerHTML = dinosaurData.disc;
	}
	
	</script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<!-- Hidden elements on this page -->
	<div style="display:none;">
		<img id="bg1" width="600" height="400" src="images/bg1.png">
		<img id="dinoNormal" width="200" height="200" src="images/dino.png"> 
	</div>
</html>
