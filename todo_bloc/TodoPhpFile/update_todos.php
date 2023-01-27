<?php

// Include the connection file
include './connection.php';

// Check if all the fields are set
if (isset($_POST['id']) && isset($_POST['title']) && isset($_POST['description'])) {
    // store the data in the variables
    $id = $_POST['id'];
    $title = $_POST['title'];
    $description = $_POST['description'];
    $date = date('Y-m-d H:i:s');

    // Create the query
    $sql = "UPDATE todo set title = '$title', description = '$description', date = '$date' where id = '$id'";
    // Run the query
    $result = mysqli_query($connect, $sql);

    // Check if the query was successful
    if ($result) {
        // If successful, create the response array
        $resp = [
            'success' => true,
            'message' => 'Todo updated successfully'
        ];
    } else {
        // If not successful, create the response array
        $resp = [
            'success' => false,
            'message' => 'Error updating todo'
        ];
    }
} else {
    // If not successful, create the response array
    $resp = [
        'success' => false,
        'message' => 'Id, title and description are required'
    ];
}
// return the response in the json format
echo json_encode($resp);







// echo json_encode($resp);
