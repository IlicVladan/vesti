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
        <form action="index.php" method="post">
        <input type="text" name="termin" placeholder='Unesite termin pretrage'> <button>Pretrazi</button><br><br>
    </form>
        <?php
              $upit="SELECT * FROM vwvesti WHERE obrisan=0 ORDER BY id DESC";
              if(isset($_GET['id']))$upit="SELECT * FROM vwvesti WHERE obrisan=0 AND id=".$_GET['id']." ORDER BY id DESC";
              if(isset($_GET['kategorija']))$upit="SELECT * FROM vwvesti WHERE obrisan=0 AND kategorija='".$_GET['kategorija']."' ORDER BY id DESC";
              if(isset($_GET['autor']))$upit="SELECT * FROM vwvesti WHERE obrisan=0 AND autor='".$_GET['autor']."'  ORDER BY id DESC";
              if(isset($_POST['termin']))$upit="SELECT * FROM vwvesti WHERE obrisan=0 AND (naslov LIKE ('%".$_POST['termin']."%') OR tekst LIKE ('%".$_POST['termin']."%'))  ORDER BY id DESC";
              $rez=$db->query($upit);
              if($db->error())
              {
                  echo "Greska prilikom izvrsavanja upita!!!!<br>";
                  echo $db->error()." (".$db->errno().")";
                  exit();
              }
              echo "Broj vesti: ".$db->num_rows($rez)."<hr>";
              $vesti= array();
              while($red=$db->fetch_object($rez))
              {
                  echo "<div style='border: 1px solid black; width:100%;margin:2px;padding:2px'>";
                  echo "<a href='index.php?kategorija=".$red->kategorija."'>".$red->naziv."</a><br>";
                  echo "<h3><a href='vesti.php?id=".$red->id."'>".$red->naslov."</a></h3>";
                  if(isset($_GET['id']))
                      echo $red->tekst;
                  else
                  {
                      $tmp=explode(" ", $red->tekst);
                      $novi=array_slice($tmp, 0, 20);
                      $a=implode(" ", $novi).".....<br>";
                      if(isset($_POST['termin']))
                          echo str_replace(strtolower($_POST['termin']), "<span style='background-color:yellow'>".$_POST['termin']."</span>", strtolower($a));
                      else
                          echo $a;
                  }
                      
                  if(file_exists("avatar/".$red->autor.".jpg")) $slika="avatar/".$red->autor.".jpg";
                  else $slika="avatar/nouser.jpg";
                  echo "<img src='{$slika}' height='25px'> ";
                  echo "<b><a href='index.php?autor=".$red->autor."'>".$red->ime ." ".$red->prezime."</a></b> <i>".$red->vreme."</i><br>";
                  echo "Pogledan: {$red->pogledan}<br>";
                  $upit="SELECT count(id) AS broj FROM komentari  WHERE idvesti={$red->id} AND dozvoljen=1 GROUP BY idvesti";
                  //echo $upit;
                  $pomrez=$db->query($upit);
                  if($db->num_rows($pomrez)==1){
                      $pomred=$db->fetch_object($pomrez);
                      echo "Broj komentara: {$pomred->broj}";
                  }
                  else
                      echo "Broj komentara: 0";
                  
                  echo "</div>";
              }
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