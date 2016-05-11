FROM php:7.0.6-fpm


RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libcurl4-gnutls-dev \
        git \
    && docker-php-ext-install iconv mcrypt mysqli curl iconv json mbstring opcache sockets zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && cd /usr/src/php/ext/ \
    && git clone https://github.com/phpredis/phpredis.git \
    && cd phpredis \
    && git checkout php7 \
	&& docker-php-ext-install phpredis  \
	&& cd /usr/src/php/ext/ \
	&& git clone https://github.com/igbinary/igbinary.git \
	&& cd igbinary \
	&& git checkout php7-dev-playground1 \
	&& docker-php-ext-install igbinary \
	&& rm -r /var/lib/apt/lists/*

#RUN cd /usr/src/php/ext/ &&  git clone git://github.com/xdebug/xdebug.git && docker-php-ext-install xdebug
	