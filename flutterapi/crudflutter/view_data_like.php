<?php 
	if($_SERVER['REQUEST_METHOD']=='GET'){
						
		$nama  = $_GET['nama'];
		require_once('dbConnect.php');
			
		$sql = "select * from mahasiswa where nama like '%$nama%'";		
		$r = mysqli_query($con,$sql);				
		$result = array();
				
		//looping through all the records fetched
		while($row = mysqli_fetch_array($r)){
			array_push($result,array(			
			"id"=>$row['id'],		
			"nama"=>$row['nama'],		    
			"nim"=>$row['nim'],
            "prodi"=>$row['prodi'], 
            "alamat"=>$row['alamat']		
			));
		}
		
		//Displaying the array in json format 
		echo json_encode(array($result));		
		mysqli_close($con);		
	}
	
?>

<!-- [{"id":"1","nama":"Salma Salsabila Dwinta","nim":"21161562044","prodi":"Informatika","alamat":"Tulungagung"},{"id":"2","nama":"Fitriana Durrotul Hikmah","nim":"21161562047","prodi":"Ilmu Komunikasi","alamat":"Surabaya"},{"id":"3","nama":"Maria Killa Davita","nim":"21161562048","prodi":"Teknik Industri","alamat":"Tangerang"},{"id":"4","nama":"Jessica Hutasoit","nim":"21161562045","prodi":"Teknik Industri","alamat":"Medan"}][{"id":"1","nama":"Salma Salsabila Dwinta","nim":"21161562044","prodi":"Informatika","alamat":"Tulungagung"}] -->