FROM python:3.6
RUN pip install pypiserver passlib
RUN mkdir /data && mkdir /data/packages
WORKDIR /data
RUN addgroup pypiserver && \
    useradd -ms /bin/bash pypiserver -g pypiserver
RUN chown -R pypiserver:pypiserver /data
ADD ./SamplePackage/dist /data/packages
USER pypiserver
EXPOSE 8080

ENTRYPOINT ["pypi-server", "-p", "8080", "./packages"]
CMD ["packages"]