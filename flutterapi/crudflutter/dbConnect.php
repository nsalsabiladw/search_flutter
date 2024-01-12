<?php

	//Defining Constants
	define('host','localhost');
	define('name','root');
	define('pass','');
	define('db','crudflutter');
	
	//Connecting to Database
	$con = mysqli_connect(host,name,pass,db) or die('Unable to Connect');

?>
