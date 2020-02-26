FROM centos:centos7
COPY  nginx-1.16.0 /usr/local/nginx-1.16.0
RUN   yum -y install gcc &&  \ 
      yum install -y pcre pcre-devel && \
      yum install -y zlib zlib-devel && \ 
      yum install -y openssl openssl-devel && \
      chmod 777 -R  /usr/local/nginx-1.16.0 && \
      cd  /usr/local/nginx-1.16.0 && \
      ./configure  && \
      make && \ 
      make install
COPY  index.html /usr/local/nginx/html/index.html 
EXPOSE 80 443 
CMD ["/usr/local/nginx/sbin/nginx","-g","daemon off ;"]      