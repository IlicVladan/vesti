      <div id="header">
        <img src="images/logo1.png" alt="logo">
        <ul>
            <li><a href="index.php">Pocetna</a></li>
            <li>
            <div class="dropdown">
              <button class="dropbtn">Kategorije</button>
              <div class="dropdown-content">
                <?php
                $upit="SELECT * FROM kategorije";
                $rez=$db->query($upit);
                while($red=$db->fetch_object($rez))
                  echo "<a href='index.php?kategorija={$red->id}'>{$red->naziv}</a>";
                ?>
              </div>
            </div>
          </li>
          <li><a href="#">Kontakt</a></li>
          <li><a href='adduser.php'>Registracija</a></li>
          <?php
          if(login())
            echo "<li><a href='logout.php'>{$_SESSION['ime']} ({$_SESSION['status']}) - odjava</a></li>";
          else
            echo "<li><a href='login.php'>Prijava</a></li>";
          ?>
          
        </ul>
</div>
<div id="pano">
        <img src="images/1.jpg" alt="front">
</div>  