FROM ubuntu:latest
RUN apt-get -y update &&\
    apt-get install -y \
    gprbuild \
    gnat \
    curl \
    zip \
    make \
    nginx
RUN curl -k https://github.com/mk270/whitakers-words/archive/master.zip -o /home/whitakers-words.zip -L &&\
    unzip /home/whitakers-words.zip -d /home &&\
    rm /home/whitakers-words.zip &&\
    cd /home/whitakers-words-master &&\
    make
ADD sorter.* /var/www/html/

EXPOSE 80 443
CMD service nginx start
