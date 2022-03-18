FROM alpine:3.15

RUN apk add --no-cache socat python2 build-base python2-dev 
RUN python2 -m ensurepip &&\
    pip install pycrypto

COPY files/ ./

EXPOSE 8000

CMD ["socat","-d","-d","-d","-d","-v", "TCP-LISTEN:8000,fork,reuseaddr", "EXEC:python2 generator.py,pty,stderr"]
