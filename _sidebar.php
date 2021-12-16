<div id="sidebar">
<?php
if(login())
{
  //echo "Prijavljen";
  if($_SESSION['status']=='Administrator')
  {
    echo "<h2>Vesti</h2>";
    echo "<ul>";
    echo "<li><a href='addnews.php'>Dodaj vest</a></li>"; 
    echo "<li><a href='deletenews.php'>Obrisi vest</a></li>"; 
    echo "</ul>";

    echo "<h2>Korisnici</h2>";
    echo "<ul>";
    echo "<li><a href='adduser_admin.php'>Dodaj korisnika sa pravima</a></li>"; 
    echo "<li><a href='deleteuser.php'>Obrisi korisnika</a></li>"; 
    echo "</ul>"; 

    echo "<h2>Neodobreni komentari</h2>";
    echo "<ul>";
    echo "<li><a href='dozvola.php'>Pregledajte komentare</a></li>"; 
    echo "</ul>";
    
    echo "<h2>Brisanje komentara</h2>";
    echo "<ul>";
    echo "<li><a href='dozvolakorisnik.php'>Obrisi komentar</a></li>"; 
    echo "</ul>";

    echo "<h2>Profil</h2>";
    echo "<ul>";
    echo "<li><a href='profil.php'>Profil</a></li>"; 
    echo "<li><a href='logout.php'>Odjava</a></li>"; 
    echo "</ul>";
  }
  else if($_SESSION['status']=='Urednik')
  {
    echo "<h2>Vesti</h2>";
    echo "<ul>";
    echo "<li><a href='addnews.php'>Dodaj vest</a></li>"; 
    echo "<li><a href='deletenews.php'>Obrisi vest</a></li>"; 
    echo "</ul>";
    echo "<h2>Profil</h2>";
    echo "<ul>";
    echo "<li><a href='profil.php'>Profil</a></li>"; 
    echo "<li><a href='logout.php'>Odjava</a></li>"; 
    echo "</ul>";
    echo "<h2>Brisanje komentara</h2>";
    echo "<ul>";
    echo "<li><a href='dozvolakorisnik.php'>Obrisi komentar</a></li>"; 
    echo "</ul>";
  }
  else if($_SESSION['status']=='Korisnik')
  {
    echo "<h2>Brisanje komentara</h2>";
    echo "<ul>";
    echo "<li><a href='dozvolakorisnik.php'>Obrisi komentar</a></li>"; 
    echo "</ul>";
  }
}
?>
    <h2>Info</h2>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nulla ab nostrum harum dolor ea obcaecati voluptates voluptatibus animi, ratione quidem optio deserunt, magni officia dolorum nesciunt consectetur tempora magnam voluptas! <a href="#">Read more...</a></p>
    <h2>Popular tags</h2>
    <div id="cloud">
      <ul>
        <li><a href="#">First</a></li>
        <li><a href="#">Second</a></li>
        <li><a href="#">third</a></li>
        <li><a href="#">something</a></li>
        <li><a href="#">about</a></li>
        <li><a href="#">web</a></li>
        <li><a href="#">design</a></li>
      </ul>
    </div>
<img src="images/reklama.gif" alt="">
</div>
            

        