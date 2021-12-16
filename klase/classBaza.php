<?php
class Baza{
    protected $lokacija;
    protected $korime;
    protected $lozinka;
    protected $baza;
    protected $db;
    public function __construct(){
        $this->lokacija="localhost";
        $this->korime="root";
        $this->lozinka="";
        $this->baza="news";
    }
    public function __destruct(){
        mysqli_close($this->db);
    }
    public function connect(){
        $this->db=@mysqli_connect($this->lokacija, $this->korime, $this->lozinka, $this->baza);
        if(!$this->db) return false;
        $this->query("SET NAMES utf8");
        return $this->db;
    }

    public function query($upit){
        return mysqli_query($this->db, $upit);
    }

    public function fetch_assoc($rez){
        return mysqli_fetch_assoc($rez);
    }

    public function fetch_object($rez){
        return mysqli_fetch_object($rez);
    }

    public function error(){
        return mysqli_error($this->db);
    }

    public function errno(){
        return mysqli_errno($this->db);
    }

    public function num_rows($rez){
        return mysqli_num_rows($rez);
    }

    public function insert_id(){
        return mysqli_insert_id($this->db);
    }
}
?>