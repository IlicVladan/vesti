<?php
function meni($db)
{
    $upit="SELECT DISTINCT kategorija FROM vesti";
    $rez=$db->query($upit);
    echo "<div><a href='vesti.php'>Pocetna</a> ";
    while($red=$db->fetch_assoc($rez))
        echo "<a href='vesti.php?kategorija=".$red['kategorija']."'>".$red['kategorija']."</a> ";
    echo "</div>";

}

function validanString($str)
{
    if(strpos($str, ' ')!==false) return false;
    if(strpos($str, '=')!==false) return false;
    if(strpos($str, '(')!==false) return false;
    if(strpos($str, ')')!==false) return false;
    if(strpos($str, '*')!==false) return false;
    return true;
}

function login()
{
    if(isset($_SESSION['id']) and isset($_SESSION['ime']) and isset($_SESSION['status']))
        return true;
    else if(isset($_COOKIE['id']) and isset($_COOKIE['ime']) and isset($_COOKIE['status']) )
    {
        $_SESSION['id']=$_COOKIE['id'];
        $_SESSION['ime']=$_COOKIE['ime'];
        $_SESSION['status']=$_COOKIE['status'];
        return true;
    }
    else

        return false;
}
?>