FROM php:7.2-fpm

RUN set -xe && \
        curl -LO https://github.com/jbboehr/php-psr/archive/v1.1.0.tar.gz && \
        tar xzf ${PWD}/v1.1.0.tar.gz && \
        curl -LO https://github.com/phalcon/cphalcon/archive/v3.2.0.tar.gz && \
        tar xzf ${PWD}/v3.2.0.tar.gz && \
        docker-php-ext-install -j $(getconf _NPROCESSORS_ONLN) \
            ${PWD}/php-psr-1.1.0 \
            ${PWD}/cphalcon-3.2.0/build/php7/64bits \
        && \

        rm -r \
            ${PWD}/v1.1.0.tar.gz \
            ${PWD}/php-psr-1.1.0 \
            ${PWD}/v3.2.0.tar.gz \
            ${PWD}/cphalcon-3.2.0 \
        && \
        php -m

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends software-properties-common \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libssl-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libedit-dev \
    libedit2 \
    libonig-dev \
    libpq-dev \
    libxslt1-dev \
    libzip-dev \
    apt-utils \
    gnupg \
    git \
    vim \
    wget \
    curl \
    lynx \
    psmisc \
    unzip \
    tar \
    cron \
    bash-completion \
    && apt-get clean

RUN docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    docker-php-ext-install \
    opcache \
    gd \
    bcmath \
    intl \
    soap \
    xsl \
    zip

RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install gettext
RUN docker-php-ext-install mysqli pdo_mysql && docker-php-ext-enable pdo_mysql
RUN docker-php-ext-configure intl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY docker-phalcon-* /usr/local/bin/