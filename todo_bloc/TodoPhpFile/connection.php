<?php

// specify host name
$dbhost = 'localhost';
// specify user name
$dbuser = 'root';
// specify password
$dbpass = '';
// specify database name
$dbname = 'Todos';

// Make connection with the specified values
$connect = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
