<?php
$flag = 'flag{PhP_Re@11y_Th!_8@5t_0n#}';
if (isset($_GET['a']) and isset($_GET['b'])) {
    if ($_GET['a'] != $_GET['b']) {
        if (md5($_GET['a']) === md5($_GET['b'])) {
            echo ('Flag: '.$flag);
        }else {
            echo 'Wrong.';
        }
    }
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>404 Error</title>
<meta name="description" content="404 Error" />
<meta name="keywords" content="404, error" />
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div class="wrapper">
<div class="content">
<div id="whoops"></div>
<p>The page you are looking for seems to be missing.<br/>
<div id="divider"></div>
</div>
</div>
</div>
 </div>
</body>
</html>
<!--
?php
if (isset($_GET['a']) and isset($_GET['b'])) {</br>
if ($_GET['a'] != $_GET['b']) {</br>
if (md5($_GET['a']) === md5($_GET['b'])) {</br>
echo ('Flag: '.$flag);</br>
}else {</br>
echo 'Wrong.';</br>
}</br>
}</br>
}
