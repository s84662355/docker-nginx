FROM centos:centos7
COPY  nginx-1.16.0 /usr/local/nginx-1.16.0
RUN   yum -y install gcc &&  \ 
      yum install -y pcre pcre-devel && \
      yum install -y zlib zlib-devel && \ 
      yum install -y openssl openssl-devel && \
      cd  /usr/local/nginx-1.16.0 && \
      ./configure  && \
      make && \ 
      make install
EXPOSE 80 443 
CMD ["nginx","-g","daemon off ;"]      