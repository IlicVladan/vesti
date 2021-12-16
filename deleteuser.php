<?php
session_start();
require_once("_require.php");
$db=new Baza();
if(!$db->connect())exit();
$poruka="";
if($_SESSION['status']!="Administrator")
{
    echo Poruka::info("Samo Administrator moze videti ovu stranicu!!!!");
    echo "<a href='index.php'>Pocetna</a>";
    exit();
}
if(isset($_POST['btnSnimi']))
{
    $idKorisnika=$_POST['idKorisnika'];
    if($idKorisnika!='0')
    {
        $upit="DELETE FROM korisnici WHERE id={$idKorisnika}";
        $db->query($upit);
        if($db->error())
            $poruka=Poruka::greska("Greska prilikom izvrsavanja upita<br>".$db->error());
        else
        {
            $poruka=Poruka::uspeh("Uspesno obrisan korisnik");
            if(file_exists("avatar/".$idKorisnika.".jpg")) unlink("avatar/".$idKorisnika.".jpg");
        }
            
    }
    else
        $poruka=Poruka::greska("Niste izabrali korisnika za brisanje!!!");
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

        <h2>Brisanje korisnika</h2>
        <form action="deleteuser.php" method="post">
            <select name="idKorisnika" id="idKorisnika">
                <option value="0">--Izaberite korisnika za brisanje--</option>
                <?php
                $upit="SELECT * FROM korisnici";
                $rez=$db->query($upit);
                while($red=$db->fetch_object($rez))
                    echo "<option value='{$red->id}'>{$red->id}: {$red->ime} {$red->prezime}</option>";
                ?>
            </select><br><br>
            <button name="btnSnimi">Obrisite korisnika</button>
        </form>
        <hr>
        <?php
        
              
              
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