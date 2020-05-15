<head>
<meta charset="UTF-8">
<title>航空公司小百科</title>
<h1>航空公司小百科</h1>
</head>
<body>
<form method="GET" action="index.php">
    <input name="search" placeholder="请输入航司二字代码" />
    <button type="submit">搜索</button>
</form>
</body>

<?php
if(isset($_GET['search'])) {
    $searchAirline = trim($_GET['search']);
    if($searchAirline === '') {
        die;
    }
    if($searchAirline === 'flag') {
        echo '不会这么简单就给你flag哦~，再想想。<br/>';
        echo '$ cd ..<br/>';
        echo '$ ls<br/>';
        echo 'airlines  index.php  flag.txt<br/>';
        echo '$ cat flag.txt<br/>';
        echo '...<br/>';
        die;
    }
    $filename = "airlines/".$searchAirline;
    include($filename);
}
?>