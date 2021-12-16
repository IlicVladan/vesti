<?php
class Vest{
    protected $id;
    protected $naslov;
    protected $tekst;
    protected $vreme;
    protected $autor;
    protected $kategorija;
    protected $obrisan;
    protected $izmena;
    public function __construct($a, $b, $c, $d, $e, $f, $g, $h){
        $this->id=$a;
        $this->naslov=$b;
        $this->tekst=$c;
        $this->vreme=$d;
        $this->autor=$e;
        $this->kategorija=$f;
        $this->obrisan=$g;
        $this->izmena=$h;
    }
    public function kategorija(){
        return "<a href='vesti.php?kategorija=".$this->kategorija."'>".$this->kategorija."</a><br>";
    }
    public function naslov(){
        return "<h3><a href='vesti.php?id=".$this->id."'>".$this->naslov."</a></h3>";
    }
    public function aiv(){
        return "<b><a href='vesti.php?autor=".$this->autor."'>".$this->autor."</a></b> <i>".$this->vreme."</i><br>";
    }
    public function tekst(){
        return $this->tekst."<br>";
    }
    public function deoTeksta(){
        $tmp=explode(" ", $this->tekst);
        $novi=array_slice($tmp, 0, 20);
        return implode(" ", $novi).".....<br>";
    }
    public function __get($name){
        return $this->$name;
    }
}

?>