<?php
session_start();
require_once("_require.php");
$db=new Baza();
if(!$db->connect())exit();
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
        
        <?php
          
              if(isset($_GET['id']))$upit="SELECT * FROM vwvesti WHERE obrisan=0 AND id=".$_GET['id'];

              $rez=$db->query($upit);
              if($db->error())
              {
                  echo "Greska prilikom izvrsavanja upita!!!!<br>";
                  echo $db->error()." (".$db->errno().")";
                  exit();
              }
              
              while($red=$db->fetch_object($rez))
              {
                  echo "<div style='border: 1px solid black; width:100%;margin:2px;padding:2px'>";
                  echo "<a href='index.php?kategorija=".$red->kategorija."'>".$red->naziv."</a><br>";
                  echo "<h3><a href='vesti.php?id=".$red->id."'>".$red->naslov."</a></h3>";
                  echo $red->tekst;
                  echo "<br>";

                  if(file_exists("avatar/".$red->autor.".jpg")) $slika="avatar/".$red->autor.".jpg";
                  else $slika="avatar/nouser.jpg";
                  echo "<img src='{$slika}' height='25px'> ";
                  
                  echo "<b><a href='index.php?autor=".$red->autor."'>".$red->ime ." ".$red->prezime."</a></b> <i>".$red->vreme."</i><br>";
                  echo "</div>";
                  $pogledan=$red->pogledan;
              }
              $upit="UPDATE vesti SET pogledan=pogledan+1 WHERE id=".$_GET['id'];
              $db->query($upit);
              
          ?>

          

<br><br>
<?php
          
          if(isset($_GET['id']))
          {
              $id=$_GET['id'];
          }
?>
<?php if(Login())
     { ?>
          <form action="vesti.php?id=<?= $id?>" method="post">
              <textarea name="komentar" id="komentar" cols="30" rows="10" placeholder="Unesite komentar" required></textarea><br><br>
              <button>Snimite komentar</button>
          </form>
          <br><br>
<?php }
else echo "<b>Snimanje komentara samo za prijavljene korisnike!</b><br><br>";
?>
         
          <?php
          //Snimanje komentara
          if(isset($_GET['id']) and isset($_POST['komentar']))
          {
              $id=$_GET['id'];
              $ime=$_SESSION['ime'];
              $komentar=$_POST['komentar'];
              if($id!="" and $ime!="" and $komentar!="")
              {
                  $ime=filter_var($ime, FILTER_SANITIZE_STRING);
                  $komentar=filter_var($komentar, FILTER_SANITIZE_STRING);
                  $upit="INSERT INTO komentari (idvesti, ime, komentar) VALUES ({$id}, '{$ime}', '{$komentar}')";
                  $db->query($upit);
                  if($db->error())
                      echo Poruka::greska("Neuspelo snimanje u bazu!!!<br>".$db->error());
                  else
                      echo Poruka::uspeh("Uspesno snimljen komentar u bazu");
              } 
              else
                  echo Poruka::info("Svi podaci su obavezni!!!");
          }
          ?>
          <?php
          //Prikaz komentara
          $upit="SELECT * FROM komentari WHERE idvesti={$id} AND dozvoljen=1 ORDER by vreme DESC";
          $rez=$db->query($upit);
          if(Login())
         { 
            if($db->num_rows($rez)==0)
                 echo Poruka::info("Nema ni jedan komentar!!!! Budite prvi!!!!");
         }


          while($red=$db->fetch_object($rez))
          {
              echo "<div>";
              
              echo "<div><b>{$red->ime}</b> <br> <i>{$red->vreme}</i></div>";
              echo "<div>{$red->komentar}</div>";
              echo "</div><br>";
          } 
          
          
              echo "Pogledan puta: ".$pogledan;

              
              unset($db);
               ?> 

        </div>

        <?php include_once("_sidebar.php")?>
        </div>
        <?php include_once("_futer.php")?>
    </div>
</div>
</body>
</html>