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
if($_SESSION['status']!="Administrator")
{
    echo Poruka::info("Samo Administrator moze videti ovu stranicu!!!!");
    echo "<a href='index.php'>Pocetna</a>";
    exit();
}

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
        <h1>Neodobreni komentari</h1>
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
        $upit="SELECT * FROM komentari WHERE dozvoljen=0";
        $rez=$db->query($upit);
        if($db->num_rows($rez)>0)
        {
            while($red=$db->fetch_object($rez))
            {
                echo "<div>";
                echo "<div><b>{$red->ime}</b> <i>{$red->vreme}</i></div>";
                echo "<div>{$red->komentar}</div>"; 
                echo "<a href='dozvola.php?idKomentara={$red->id}&akcija=brisanje'>Obrisi</a> | ";
                echo "<a href='dozvola.php?idKomentara={$red->id}&akcija=dozvoli'>Dozvoli</a>";
                echo "</div><br>";
            }
        }
        else
            $poruka= Poruka::info("Nemate ni jedan nedozvoljen komentar!!!");
                    
    
              
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