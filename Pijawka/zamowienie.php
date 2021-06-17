<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Zamowienie</title>
</head>
<body>
    <?php
        $imie =$_POST['imie'];
        $nazwisko =$_POST['nazwisko'];
        $miasto =$_POST['miasto'];
        $ulica =$_POST['ulica'];
        $domu =$_POST['domu'];
        $kod =$_POST['kod'];
        echo "<h2>$imie, twoje zamowienie na piwo zostanie dostarczone na adres:</h2>";
        echo "<h2>$miasto, $ulica $domu</h2>";
    ?>
</body>
</html>

