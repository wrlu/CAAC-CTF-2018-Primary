import tornado.ioloop
import tornado.web
from tornado.escape import url_unescape
from tornado.template import Loader, Template

TEMPLATE = '''
<html>
<head><title> 404 Error </title></head>
<body>Your request url: FOO not found</body>
</html>
'''


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Welecome to ctf, have fun !")
        # return self.render('index.html')


class errorHandler(tornado.web.RequestHandler):

    def get(self):
        url = url_unescape(self.request.path)
        template_data = TEMPLATE.replace("FOO", url)
        t = tornado.template.Template(template_data)
        self.write(t.generate())

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r".*", errorHandler)
    ])


if __name__ == "__main__":
    app = make_app()
    app.listen(8233)
    tornado.ioloop.IOLoop.current().start()
