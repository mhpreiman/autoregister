<?php

class myClass {
    public $var;  //public vars are needed to get values for outside use
    public STATIC $var2;
    
    private  function privMethod ($a) {
        $privvar = $a;
        return $privvar;
    }
    function pubMethod($a) {
        $pubvar = $this->privMethod($a);    //get priv method value and save to var to pass on
        $this->var = $pubvar;                       //$this keyword is needed to set value of vars (as opposed to constants )
    }
}
$w = new myClass();
$w->pubMethod("uus");
$w = myClass::$var2;    //static var

?>