## Versão: cursos-e-eventos-v1.0

- Nesta versão, as seguintes melhorias foram feitas:
  - Atualizar Dockerfile
    - Habilitar todos os sites.
    - Ativar os módulos proxy, proxy_http e rewrite.
    - Instalar git e vi.
    - Configurar o arquivo php.ini.
    - Definir o ServerName no apache2.conf.
    - Criar o diretório /var/lib/php/sessions e definir a propriedade.
    - Criar um diretório temporário para uploads e definir a propriedade e permissões.

  - Atualizar docker-compose.yml
    - Atualizar a versão para '3.8'.
    - Definir o nome do container como cursos-e-eventos-docker.
    - Definir a política de reinicialização como always.
    - Atualizar os volumes para refletir o caminho correto.
    - Atualizar o comando para incluir git submodule update.

  - Atualizar php.ini
    - Definir upload_tmp_dir como /tmp/uploads.

## Autor

Este projeto foi desenvolvido por Filipe Onoue.
