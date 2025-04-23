## Versão: cursos-e-eventos-v1.0

- Nesta versão, as seguintes melhorias foram feitas:
  - Habilitar todos os sites no Dockerfile.
  - Ativar os módulos proxy, proxy_http e rewrite no Dockerfile.
  - Instalar git e vi no Dockerfile.
  - Configurar o arquivo php.ini no Dockerfile.
  - Definir o ServerName no arquivo apache2.conf no Dockerfile.
  - Criar o diretório /var/lib/php/sessions e definir a propriedade no Dockerfile.
  - Criar um diretório temporário para uploads e definir a propriedade e permissões no Dockerfile.
  - Atualizar a versão do docker-compose.yml para '3.8'.
  - Definir o nome do container como cursos-e-eventos-docker no docker-compose.yml.
  - Definir a política de reinicialização como always no docker-compose.yml.
  - Atualizar os volumes para refletir o caminho correto no docker-compose.yml.
  - Atualizar o comando para incluir git submodule update no docker-compose.yml.
  - Atualizar o arquivo php.ini para definir upload_tmp_dir como /tmp/uploads.

## Autor

Este projeto foi desenvolvido por Filipe Onoue.
