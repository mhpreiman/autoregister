<?php

//SELECT car brand 
$carBrands = select('SELECT mark FROM auto GROUP BY mark;');
//SELECT city
$carRegCity = select('SELECT linnid,nimi FROM linnad GROUP BY linnid;');
//SELECT logs
$logs = select('SELECT logi.*, linnad.nimi FROM logi LEFT JOIN linnad ON logi.regpiirk=linnad.linnid;');



//INSERT CAR
if(isset($_POST['autoPOST']) ) {
    
    $input = array (
        0 => htmlspecialchars($_POST['regnr']),               // ":regnr" => $_POST['regnr'],
        1 => htmlspecialchars($_POST['regpiirk']),
        2 => htmlspecialchars($_POST['mark']),
        3 => htmlspecialchars($_POST['aasta'])
    );    
    
   $carInsert = insert('INSERT INTO auto (regnr, regpiirk, mark, aasta) VALUES ("'.$input[0].'",    '.$input[1].',   "'.$input[2].'",   '.$input[3].')   ;');
}
//INSERT CITY
else if (isset($_POST['linnPOST']) ) {

    $input = array (
        0 => $_POST['linn'],               // ":regnr" => $_POST['regnr'],
        1 => $_POST['rahvaarv'],
    );

    $cityInsert = insert('INSERT INTO linnad (nimi, rahvaarv) VALUES ("'.$input[0].'",'.$input[1].');');
};


?>