<?php

//function select($t, $f = "all")  {
//    $table = $t;
//    $fields = $f;
//}

    function select($sql) {
        $con = ConnectDB::getInstance();
        $result = $con->query($sql);
        $fields = [];
        
        foreach($result->fetchAll() as $field) {
            $fields[] = $field;
        }
        return $fields;
    }
    
    function insert($sql) {
        $con = ConnectDB::getInstance();
        $result = $con->query($sql);
        $fields = [];
    }

