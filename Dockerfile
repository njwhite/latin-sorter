FROM openresty/openresty:xenial
RUN apt-get -y update &&\
    apt-get install -y \
    gprbuild \
    gnat-4.9 \
    libgnat-4.9 \
    curl \
    zip \
    make &&\
    curl -k https://github.com/mk270/whitakers-words/archive/master.zip -o /home/whitakers-words.zip -L &&\
    unzip /home/whitakers-words.zip -d /home &&\
    rm /home/whitakers-words.zip &&\
    cd /home/whitakers-words-master &&\
    make &&\
    apt-get --purge autoremove -y \
    gprbuild \
    gnat-4.9 \
    curl \
    zip \
    make
ADD *.js *.css *.htm *.html /usr/local/openresty/nginx/html/
ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

EXPOSE 80
WORKDIR /home/whitakers-words-master
