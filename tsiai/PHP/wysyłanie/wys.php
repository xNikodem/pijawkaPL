<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			td {
			border: solid #000 1px;
			padding: 5px;
			}
			
		
		</style>
	</head>
	<body>
	
	<?php
		$conn = new mysqli ("localhost", "root", "", "tsiai") or die ("error");
	
		$wynik = $conn->querry("SELECT * FROM tsiai ");
	
		if($wynik->num_rows > 0) {
			
			echo "<table>";
			echo "<tr>";
			echo "<td>id Klienta</td>";
			echo "<td>id Zamowienia</td>";
			echo "<td>id Sprzedawcy</td>";
			echo "<td>id Klienta</td>";
			echo "<td>imie</td>";
			echo "<td>nazwisko</td>";
			echo "<td>adres</td>";
			echo "</tr>;
		

			while( $wiersz = $wynik->fetch_assoc() ){
					echo "<tr>";
					echo "<td>" . $wiersz["id_Towaru"] . "</td>";
					echo "<td>" . $wiersz["id_Zamowienia"] . "</td>";
					echo "<td>" . $wiersz["id_Sprzedawcy"] . "</td>";
					echo "<td>" . $wiersz["id_Klienta"] . "</td>";
					echo "<td>" . $wiersz["imie"] . "</td>";
					echo "<td>" . $wiersz["nazwisko"] . "</td>";
					echo "<td>" . $wiersz["adres"] . ";<br>";
					echo "</tr>";
			}
			echo"</table>;
			
		}else {
			
			
			echo"baza danych jest pusta";
		}
	
	
		$conn->close();
		
	?>
	
	
	
	</body>
</html>