import tornado.web
from sqlalchemy.orm.exc import NoResultFound
from sshop.base import BaseHandler
from sshop.models import Commodity, User
from sshop.settings import limit
# import xml.dom.minidom


class ShopIndexHandler(BaseHandler):
    def get(self, *args, **kwargs):
        return self.redirect('/shop')


class ShopListHandler(BaseHandler):
    def get(self):
        page = self.get_argument('page', 1)
        page = int(page)
        page = int(page) if int(page) else 1
        commoditys = self.orm.query(Commodity) \
            .filter(Commodity.amount > 0) \
            .order_by(Commodity.price.desc()) \
            .limit(limit).offset((page - 1) * limit).all()
        return self.render('index.html', commoditys=commoditys, preview=page - 1, next=page + 1, limit=limit)


class ShopDetailHandler(BaseHandler):
    def get(self, id=1):
        self.set_cookie('id', id)
        try:
            commodity = self.orm.query(Commodity) \
                .filter(Commodity.id == int(id)).one()
        except NoResultFound:
            return self.redirect('/')
        return self.render('info.html', commodity=commodity)


class ShopPayHandler(BaseHandler):
    @tornado.web.authenticated
    def post(self):
        # return self.redirect('/wechat')
        try:
            id = self.get_cookie('id')
            id = int(id)
            if(id == 1):
                return self.redirect('/wechat')
            commodity = self.orm.query(Commodity).filter(Commodity.id == id).one()
            price = commodity.price
            user = self.orm.query(User).filter(User.username == self.current_user).one()
            res = user.pay(float(price))
            if res:
                user.integral = res
                self.orm.commit()
                return self.render('pay.html', success=1, commodity=commodity)
            self.orm.commit()
            return self.render('pay.html', danger=1)
        except:
            return self.render('pay.html', danger=1)


class ShopCarHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self, *args, **kwargs):
        id = self.get_secure_cookie('commodity_id')
        id = int(id)
        if id:
            commodity = self.orm.query(Commodity).filter(Commodity.id == int(id)).one()
            return self.render('shopcar.html', commodity=commodity)
        return self.render('shopcar.html')

    @tornado.web.authenticated
    def post(self, *args, **kwargs):
        try:
            id = self.get_cookie('id')
            id = int(id)
            if(id == 1):
                return self.redirect('/wechat')
            commodity = self.orm.query(Commodity).filter(Commodity.id == id).one()
            price = commodity.price
            user = self.orm.query(User).filter(User.username == self.current_user).one()
            res = user.pay(float(price))
            if res:
                user.integral = res
                self.orm.commit()
                self.clear_cookie('commodity_id')
                return self.render('pay.html', success=1, commodity=commodity)
            return self.render('pay.html', danger=1)
        except Exception as ex:
            print str(ex)
        return self.redirect('/shopcar')


class ShopCarAddHandler(BaseHandler):
    def post(self, *args, **kwargs):
        id = self.get_argument('id')
        self.set_secure_cookie('commodity_id', id)
        self.set_cookie('id', id)
        return self.redirect('/shopcar')


class SecKillHandler(BaseHandler):
    def get(self, *args, **kwargs):
        return self.render('seckill.html')

    def post(self, *args, **kwargs):
        try:
            id = self.get_argument('id')
            id = int(id)
            commodity = self.orm.query(Commodity).filter(Commodity.id == id).one()
            commodity.amount -= 1
            self.orm.commit()
            return self.render('seckill.html', success=1)
        except:
            return self.render('seckill.html', danger=1)


class WeChatPayHandler(BaseHandler):
    def get(self, *args, **kwargs):
        return self.render('wechat.html')


class ErrorHandler(BaseHandler):
    def get(self, *args, **kwargs):
        return self.render('404.html')
