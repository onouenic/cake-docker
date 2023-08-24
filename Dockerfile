# Use a imagem base do PHP com Apache (PHP 7.4)
FROM php:7.4-apache

# Instala o composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Define o diretório root
WORKDIR /var/www/html/

# Defina um usuário e um grupo personalizados
ARG USER_ID=1001
ARG GROUP_ID=1001

# Copia o arquivo apache2.conf para o container
COPY ./Config/apache2.conf /etc/apache2/apache2.conf

# Copia o arquivo 000-default para o container
COPY ./Config/000-default.conf /etc/apache2/sites-available/000-default.conf

# Instale as dependências do apache2
RUN a2enmod

# Instale as dependências necessárias e as extensões do PHP
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Instalando as dependências sockets para o projeto cursos-admin
RUN docker-php-ext-install sockets

# Instalando as dependências mcrypt para o projeto cursos-admin
RUN apt-get update -y && apt-get install -y libmcrypt-dev
RUN pecl install mcrypt-1.0.4
RUN docker-php-ext-enable mcrypt

# Copie o arquivo php.ini para dentro do container
COPY php.ini /usr/local/etc/php/php.ini

# Configure o Apache para carregar o módulo PHP e iniciar em primeiro plano
RUN sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/apache2.conf

# Instalando git e vi
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install git vim -y

# Clonando plugin AuditoriaNic
# RUN cd app/Plugin/AuditoriaNic/ && \
    # git submodule init && \
    # git submodule update && cd ../../../

# Ative o módulo rewrite diretamente no Dockerfile
RUN a2enmod rewrite

# Conceder permissão
# RUN groupmod -g 1000 sharedgroup && usermod -u 1000 -g 1000 onoue

ARG USER_ID=1001
ARG GROUP_ID=1001

# USER onoue
# RUN groupadd -r sharedgroup && useradd -r -g sharedgroup -G sharedgroup www-data
# RUN chown -R www-data:sharedgroup /var/www/html/
# RUN chmod -R 755 /var/www/html/ 
# RUN chmod -R 755 /var/www/html/tmp/
# RUN chmod -R 755 /tmp/
# RUN usermod --non-unique --uid 1001 www-data \
#     && groupmod --non-unique --gid 1001 www-data \
#     && chown -R www-data:www-data /var/www/html/

# cria o diretório /var/lib/php/sessions
RUN cd /var/lib/ && mkdir -p php/sessions

# Exponha a porta 80
EXPOSE 80

# Comando para iniciar o Apache em primeiro plano
# CMD ["apache2-foreground"]