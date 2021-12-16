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

        <h2>Dodavanje korisnika</h2>
        <form action="adduser_admin.php" method="post" enctype="multipart/form-data">
            <input type="text" name="ime" placeholder="unesite ime"><br><br>
            <input type="text" name="prezime" placeholder="unesite prezime"><br><br>
            <input type="text" name="email" placeholder="unesite email"><br><br>
            <input type="text" name="sifra" placeholder="unesite šifru"><br><br>
            <textarea name="komentar" id="komentar" cols="10" rows="5" placeholder="Unesite komentar"></textarea><br><br>
            <select name="status" id="status">
                <option value="0">--Izaberite status--</option>
                <option value="Administrator">Administrator</option>
                <option value="Urednik">Urednik</option>
                <option value="Korisnik">Korisnik</option>
            </select><br><br>
            <input type="file" name="avatar"><br><br>
            <button name="btnSnimi">Snimite korisnika</button>
        </form>
        <hr>
        <?php
        if(isset($_POST['btnSnimi']))
        {
            $ime=$_POST['ime'];
            $prezime=$_POST['prezime'];
            $email=$_POST['email'];
            $sifra=$_POST['sifra'];
            $komentar=$_POST['komentar'];
            $status=$_POST['status'];
            if($ime!="" and $prezime!="" and $email!="" and $status!="0" )
            {
                $upit="INSERT INTO korisnici (ime, prezime, email, lozinka, komentar, status) VALUES ('{$ime}','{$prezime}','{$email}','{$sifra}','{$komentar}','{$status}')";
                $db->query($upit);
                if($db->error())
                    $poruka=Poruka::greska("Greska prilikom izvrsavanja upita<br>".$db->error());
                else
                {
                    $id=$db->insert_id();
                    $poruka=Poruka::uspeh("Uspesno dodat korisnik sa id: ".$id);
                    if($_FILES['avatar']['name']!="")
                    {
                        $ime="avatar/".$id.".jpg";
                        $tmp=$_FILES['avatar']['tmp_name'];
                        $dozvoljeno=array("jpg", "jpeg", "webp", "png", "bmp");
                        if(in_array(pathinfo($ime, PATHINFO_EXTENSION), $dozvoljeno))
                        {
                            if(@move_uploaded_file($tmp, $ime))
                                $poruka.=Poruka::uspeh("Uspesno prebacen avatar na server");
                            else
                                $poruka.= Poruka::greska("Neuspesan upload avatara");
                        }
                    }
                }
            }
            else
                $poruka=Poruka::greska("Svi podaci su obavezni");
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