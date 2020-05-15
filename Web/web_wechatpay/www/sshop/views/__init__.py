from Shop import *
from User import *
from Captcha import *
from wechatPay import *

handlers = [

    (r'/', ShopIndexHandler),
    (r'/shop', ShopListHandler),
    (r'/info/(\d+)', ShopDetailHandler),
    (r'/seckill', SecKillHandler),
    (r'/shopcar/add', ShopCarAddHandler),
    (r'/shopcar', ShopCarHandler),
    (r'/pay', ShopPayHandler),
    (r'/wechat', WeChatPayHandler),

    (r'/captcha', CaptchaHandler),

    (r'/user', UserInfoHandler),
    (r'/user/change', changePasswordHandler),
    (r'/pass/reset', ResetPasswordHanlder),

    (r'/login', UserLoginHanlder),
    (r'/logout', UserLogoutHandler),
    (r'/register', RegisterHandler),
    (r'/qwajsdfxjafioshqrwpieuz', wechatPayHandler),
    (r'.*', ErrorHandler)
]
