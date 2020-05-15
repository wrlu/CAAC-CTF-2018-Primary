import base64
import sys
def flag():
    a=open('flag','wb+')
    b=base64.b64encode(sys.argv[1])
    a.write(b)
    a.close()


if __name__ == '__main__':
    flag()
