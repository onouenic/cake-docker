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
RUN docker-php-ext-install pdo pdo_mysql

# Copie o arquivo php.ini para dentro do container
COPY php.ini /usr/local/etc/php/php.ini

# Configure o Apache para carregar o módulo PHP e iniciar em primeiro plano
RUN sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/apache2.conf

# Instalando git e vi
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install git vim -y

# Ative o módulo rewrite diretamente no Dockerfile
RUN a2enmod rewrite

# Conceder permissão
RUN chmod -R 755 /var/www/html/
RUN chmod -R 755 /tmp/

# Exponha a porta 80
EXPOSE 80

# Comando para iniciar o Apache em primeiro plano
CMD ["apache2-foreground"]
