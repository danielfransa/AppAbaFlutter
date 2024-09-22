# Projeto ABA - Aplicativo Mobile

Este é o aplicativo mobile do projeto ABA. O aplicativo foi desenvolvido para proporcionar uma interface intuitiva e funcional para os usuários que desejam interagir com o sistema ABA.

## Dependências

Para que o aplicativo funcione corretamente, ele depende de uma API de backend. Certifique-se de que a API esteja em funcionamento antes de executar o aplicativo.

## Configuração

### Base URL

Dependendo de como você estiver executando o aplicativo (emulador ou dispositivo físico), a `baseUrl` no arquivo `App_provider` deve ser ajustada. 

- Para **emuladores**, a base URL geralmente deve apontar para `http://10.0.2.2:PORTA`, onde `PORTA` é a porta em que sua API está rodando.
- Para **dispositivos físicos**, você precisará usar o endereço IP local da sua máquina, algo como `http://192.168.X.X:PORTA`.

### Instruções para Configurar a API

1. Clone o repositório da API backend em sua máquina local.
2. Siga as instruções de configuração do repositório da API para garantir que ela esteja rodando corretamente.
3. Ajuste a `baseUrl` no arquivo `App_provider` do aplicativo mobile para corresponder ao endereço da API.


