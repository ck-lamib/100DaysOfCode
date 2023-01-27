<?php
// include the connection file
include './connection.php';

// Check if all the fields are set
if (isset($_POST['id'])) {
    // store the data in the variables
    $id = $_POST['id'];

    // Create the query
    $sql = "DELETE from todo where id = '$id'";
    // Run the query
    $result = mysqli_query($connect, $sql);

    // Check if the query was successful
    if ($result) {
        // If successful, create the response array
        $resp = [
            'success' => true,
            'message' => 'Todo deleted successfully'
        ];
    } else {
        // If not successful, create the response array
        $resp = [
            'success' => false,
            'message' => 'Error deleting todo'
        ];
    }
} else {
    // If all fields are not set, create the response array
    $resp = [
        'success' => false,
        'message' => 'Id is required'
    ];
}

// return the response in the json format
echo json_encode($resp);







// echo json_encode($resp);
