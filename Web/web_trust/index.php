<?php
    if ($_COOKIE['admin'] == '1') {
        echo 'flag{d0_N07_7rU57_4nyB0dY}';
    } else {
        setcookie('admin', '0', time() + 3600);
        echo 'You are not the admin!';
    }
?>