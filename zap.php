<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		
	</head>
	<body>
		<?php
			if( isset($_POST["imie"]) ) {
				$imie = $_POST["imie"];
				$nazwisko = $_POST["nazwisko"];
				$telefon = $_POST["telefon"];
				$email = $_POST["email"];
				$adres = $_POST["adres"];
				
				if( empty( $imie ) || empty($nazwisko) || empty($telefon) || empty($email) || empty($adres) ) {
					echo "Wypełnij pola";
				} else {
					echo "ok";
					
					$conn = new mysqli("localhost", "root", "", "tsiai");
					
					$odp = $conn->query("INSERT INTO klient(imie, nazwisko, telefon, email, adres) VALUES ('$imie', '$nazwisko', '$telefon', '$email', '$adres')");
					
					if($odp) {
						echo "Dodano uzytkownika";
					}else{
						echo "Nie udalo sie dodac uzytkownika";
						
					}
					
					$conn->close();
				}
				
			}
		
		
		?>
		<form method="POST" action="zap.php">
		
			Imie: <input name= "imie" type="text"><br>
			Nazwisko: <input name= "nazwisko" type="text"><br>
			Numer telefonu: <input name= "nr. tel" type="number"><br>
			E-mail: <input name= "e-mail" type="e-mail"><br>
			Adres: <input name= "Adres" type="text"><br>
		
			<input type="submit" value="Zapisz">
		
		</form>
	
	</body>
</html>