<?php
include "C:/laragon/www/flutterapi/crudflutter/db.php";

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
   if(isset($_GET['keyword'])) {
       $keyword = $_GET['keyword'];

       $query = "SELECT * FROM mahasiswa WHERE nama LIKE '%$keyword%'";
       $result = mysqli_query($conn, $query);
       $data = mysqli_fetch_all($result, MYSQLI_ASSOC);

       if (!empty($data)) {
           header('Content-Type: application/json');
           echo json_encode($data);
       } 
       // else {
       //     http_response_code(404);
       //     echo json_encode(array('message' => 'No data found.'));
       // }
   } 
   // else {
   //     http_response_code(400);
   //     echo json_encode(array('message' => 'Missing keyword parameter.'));
   // }
} 
   // else {
//    http_response_code(405);
//    echo json_encode(array('message' => 'Method not allowed.'));
// }
?>
