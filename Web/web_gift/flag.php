<?php
    $flag='flag.php.bak';
    extract($_GET);
    if(isset($gift)){
        $content=trim(file_get_contents($flag));
        if($gift==$content){
            echo'flag{r3m0V3_B4CkUP_fIl3}';
        }else{
            echo'Oh no!!!';
        }
    }
?>