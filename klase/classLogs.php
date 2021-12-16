<?php
class Statistika{
    public static function upisiLog($imeDatoteke, $tekstZaUpis){
        $tekst=file_get_contents($imeDatoteke);
        $tekstZaUpis=date("d.m.Y H:i:s", time())." - ".$tekstZaUpis."\n".$tekst;
        file_put_contents($imeDatoteke, $tekstZaUpis);
    }
}
?>