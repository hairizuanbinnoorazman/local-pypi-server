FROM pypiserver/pypiserver
ADD ./sample/dist /data/packages
ADD ./.htpasswd /
ENTRYPOINT ["pypi-server", "-p", "8080", "-P", "/.htpasswd", "-a", "update,download", "./packages"]
