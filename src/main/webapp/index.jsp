<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.example.dinosaur.controller.MainController" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link type="text/css" rel="stylesheet" href="style/styles.css" />
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
			<!-- 600x400 -->
   			<canvas id="myCanvas" width="1" height="1" style="border:1px solid #000000;"> 
			</canvas>
			<img src="" id="event-1">
			<style>
			body {
			  background-image: url('images/bg1.png');
			  background-repeat: no-repeat;
			  background-position: 50% 50%;
			}
			</style> 

			
			<p id="currentLine"></p>
			<label id="status"></label>
		</center>
		
		<center>
			<button class='greenButton' id="pet" onclick="performPet()">Pet</button> &nbsp;&nbsp;
			<button class='greenButton' id="feed" onclick="performFeed()">Feed</button> &nbsp;&nbsp;
			<button class='greenButton' id="talk" onclick="performTalk()">Talk</button> 
		</center>
		
		<center>
			<h1>Stats:</h1>
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
	var time;
	var canvas = document.getElementById("myCanvas");
	var ctx = canvas.getContext("2d");
  	var bg;

  	const a1 = "images/dino_standard.gif";
  	const image = document.getElementById("event-1");
  	image.src = a1;
  	
	// the default view of the dinosaur. Always revert to this version after playing animation  	
  	var dinoStandard = document.getElementById("dinoStandardSprite");

	// the current animation of the dinosaur. This changes depending on context
  	var dinoSprite;

	
	window.onload = function() {
	  	determineTime();
	  	if (time=="day") {
		  	bg = document.getElementById("bg1");
	  	} else if (time=="night"){
			bg = document.getElementById("bg2");
	  	}
	  	dinoSprite = document.getElementById("dinoStandardSprite");
		ctx.drawImage(bg, 0, 0);
	  	ctx.drawImage(dinoSprite, 200, 175);
	  	generateNewDino();
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
	
	function performTalk(){
		var newLine = "The dinosaur wants to talk!";
	  	dinoSprite = document.getElementById("dinoChatSprite");
		updateScript(newLine);
		 $.ajax({
	           type: 'GET',
	           url: '/talk',               
	           success: function(data) {                               
	                    updateStats(data);
	            		animateScene(dinoSprite);
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
	
	determineTime = function(){
		var d = new Date();
		var now = d.getHours() * 100 + d.getMinutes();
		if (now >= 550 && now <= 1900) {
			time = "day";
		} else {
			time = "night"
		}
	};
	
	
	animateScene = function(dinoSprite){
	  	console.log("Playing animation");
	  	dinoStandard = document.getElementById("dinoStandardSprite");
	}

	function wait(ms){
		   var start = new Date().getTime();
		   var end = start;
		   while(end < start + ms) {
		     end = new Date().getTime();
		  }
		}
	
	</script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<!-- Hidden elements on this page -->
	<div style="display:none;">
		<img id="bg1" width="600" height="400" src="images/bg1.png">
		<img id="bg2" width="600" height="400" src="images/bg2.png">
		<img id="dinoStandardSprite" width="200" height="200" src="images/dino_standard.gif"> 
		<img id="dinoChatSprite" width="200" height="200" src="images/dino_standard.gif"> 
	</div>
</html>
