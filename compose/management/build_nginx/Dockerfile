FROM f1nnm/openresty-easy-ssl:release-0.3.1

# link the nginx config in
RUN ln -s /gitdeploy/compose/management/build_nginx/servers.conf /etc/nginx/conf.d/servers.conf

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]