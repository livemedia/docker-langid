FROM python:2.7.14-alpine3.6

ENV BUILD_DEPS \
                cmake \
                autoconf \
                g++ \
                gcc \
                make
ENV CFLAGS "-O3"
ENV CPPFLAGS "-O3"
ENV CXXFLAGS "-O3"

RUN apk update && apk add --no-cache --virtual .build-deps $BUILD_DEPS
RUN pip install langid
RUN apk del .build-deps

EXPOSE 8080
CMD ["langid", "-s", "-n", "--host=0.0.0.0", "--port=8080"]