from lxml import etree
import operator
import hashlib
import tornado.web


class wechatPayHandler(tornado.web.RequestHandler):
    def post(self, *args, **kwargs):
        flag = ''
        try:
            fileHandler = open('./key', 'r')
            mykey = fileHandler.readline()
            fileHandler.close()
            xml = self.request.body
            xmlData = etree.fromstring(xml, etree.XMLParser(no_network=False))
            data = dict()
            for attr in xmlData:
                data[attr.tag] = attr.text
            sorteddata = sorted(data.items(), key=operator.itemgetter(0))
            stringA = ""
            for key, val in sorteddata[:-1]:
                if stringA == "":
                    stringA += key + '=' + val
                else:
                    stringA += '&' + key + '=' + val
                stringSignTemp = stringA + '&key=' + mykey
                mySign = hashlib.md5(stringSignTemp).hexdigest().upper()
                if mySign == data['sign']:
                    fileHandler_2 = open('./jiqncxzasfjilg', 'r')
                    flag = fileHandler_2.readline()
                    fileHandler_2.close()
        except Exception as ex:
            print(str(ex))
        return self.render('404.html', flag=flag)

    def get(self, *args, **kwargs):
        return self.render('404.html', flag='')
