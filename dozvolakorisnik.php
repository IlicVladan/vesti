<?php
session_start();
require_once("_require.php");
if(!Login()){
    echo "Morate biti prijavljeni!!!!";
    exit();
}
$db=new Baza();
if(!$db->connect())exit();
$poruka="";

$upit="SELECT * FROM komentari WHERE dozvoljen=1";
        $rez=$db->query($upit);


?>
<!DOCTYPE html>
<html lang="sr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lineweb</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
    <?php include_once("_menu.php");?>
    <div class="content">
        <div id="main">
        <h1>Tvoji komentari</h1>
        <?php


if(isset($_GET['idKomentara']) and isset($_GET['akcija']))
{
    $idKomentara=$_GET['idKomentara'];
    $akcija=$_GET['akcija'];
    if($akcija=="brisanje")
        $upit="DELETE FROM komentari WHERE id={$idKomentara}";
    else
        $upit="UPDATE komentari SET dozvoljen=1 WHERE id={$idKomentara}";
    $db->query($upit);
}



$upit="SELECT * FROM komentari";//trazimo zeljene podatke	
$rez=$db->query($upit);

for($i=0;$i<mysqli_num_rows($rez);$i++)
{
  //$red=mysqli_fetch_array($rez, MYSQLI_ASSOC);-smesta podatke u asoc. niz
    $red=mysqli_fetch_assoc($rez);//radi isto kao i gornji kod
    if ($red['ime']!=$_SESSION['ime'])
    {
    }
    else 
    {
        echo "<div>";
        echo "<div><b>$red[ime]</b> <i>$red[vreme]</i></div>";
        echo "<div>$red[komentar]</div>"; 

        echo "<a href='dozvolakorisnik.php?idKomentara=$red[id]&akcija=brisanje'>Obrisi</a>";
    

        echo "</div><br>";

    }
}

              
        ?>
        <div><?= $poruka?></div>   

        </div>

        <?php include_once("_sidebar.php")?>
        </div>
        <?php include_once("_futer.php")?>
    </div>
</div>
</body>
</html>