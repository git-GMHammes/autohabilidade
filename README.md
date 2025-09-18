# 🤖 Autohabilidade - Sistema de Automação com n8n

Projeto de automação de processos utilizando n8n em containers Docker, desenvolvido para otimizar fluxos de trabalho e integração de sistemas.

## 📋 Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [Tecnologias](#tecnologias)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Uso](#uso)
- [Comandos Docker](#comandos-docker)
- [Comandos Git](#comandos-git)
- [Padrões de Commit](#padrões-de-commit)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Contribuição](#contribuição)

## 🎯 Sobre o Projeto

O Autohabilidade é um sistema de automação baseado em n8n que permite:

- ⚡ Automação de processos empresariais
- 🔄 Integração entre diferentes sistemas e APIs
- 📊 Processamento automatizado de dados
- 🚀 Workflows personalizados
- 📈 Monitoramento e relatórios automáticos

## 🛠️ Tecnologias

- **n8n** - Plataforma de automação de fluxos de trabalho
- **Docker** - Containerização
- **PostgreSQL** - Banco de dados (produção)
- **Redis** - Cache e filas (produção)
- **SQLite** - Banco de dados (desenvolvimento)

## 📋 Pré-requisitos

### Windows 10
- [Docker Desktop](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)
- WSL2 habilitado
- Git para Windows

### Verificar WSL2
```powershell
wsl --list --verbose
```

## 🚀 Instalação

### 1. Clonar o Repositório
```bash
git clone [URL_DO_REPOSITORIO]
cd autohabilidade
```

### 2. Configurar Ambiente
```cmd
# Executar setup inicial
setup.bat
```

### 3. Iniciar Containers

**Desenvolvimento:**
```cmd
docker-compose up -d
```

**Produção:**
```cmd
docker-compose --profile production up -d
```

### 4. Acessar o Sistema
- **URL:** http://localhost:5678
- **Login:** admin
- **Senha:** admin123

## 🐳 Comandos Docker

### Comandos Básicos
```cmd
# Iniciar containers
docker-compose up -d

# Parar containers
docker-compose down

# Ver logs
docker-compose logs n8n

# Status dos containers
docker-compose ps

# Restart específico
docker-compose restart n8n
```

### Build e Reconstrução
```cmd
# Build sem cache
docker-compose build --no-cache

# Rebuild específico
docker-compose build --no-cache n8n
```

### ⚠️ DESTRUIÇÃO COMPLETA (CUIDADO!)

> **🚨 ATENÇÃO:** Este comando irá **DESTRUIR TODOS** os containers, imagens, volumes e networks Docker do sistema. Use apenas em caso de necessidade absoluta!

```cmd
cd C:/laragon/www/autohabilidade

# PARAR E REMOVER TUDO
cd C:/laragon/www/autohabilidade
docker stop $(docker ps -aq)
docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -q)
docker volume prune -f
docker volume rm autohabilidade_n8n_data -f
docker network prune -f
docker system prune -af
 
# REBUILD COMPLETO
cd C:/laragon/www/autohabilidade
docker-compose build --no-cache
docker-compose up -d
 
```

### Limpeza Seletiva
```cmd
# Apenas containers parados
docker container prune -f

# Apenas imagens não utilizadas
docker image prune -a -f

# Apenas volumes não utilizados
docker volume prune -f

# Apenas networks não utilizadas
docker network prune -f
```

## 📊 Comandos Git

### Relatórios e Análises

#### Gerar Relatório Detalhado com Patches
```cmd
cd C:/laragon/www/autohabilidade

# Limpar console
clear

# Gerar relatório com patches (código alterado)
git -c core.pager=cat log --since="2025-09-10" --until="2025-10-01" --patch > relatorio_autohabilidade_202509.txt
```

#### Extrair IDs dos Commits
```cmd
cd C:/laragon/www/autohabilidade

# Limpar console
clear

# Extrair apenas os hashes dos commits
git --no-pager log --since="2025-09-01" --until="2025-09-30" --pretty=format:"%H" > commits_autohabilidade_202509.txt
```

#### Análise Detalhada de Commits Específicos (PowerShell)
```powershell
cd C:/laragon/www/autohabilidade

# Arquivo de saída
$outFile = "analise_commits_autohabilidade_$(Get-Date -Format 'yyyyMMdd').txt"
if (Test-Path $outFile) { Remove-Item $outFile }

# Lista de commits para análise
$commits = @(
    "HASH_COMMIT_1",
    "HASH_COMMIT_2",
    "HASH_COMMIT_3"
)

# Gerar análise detalhada
foreach ($commit in $commits) {
    Add-Content $outFile "=== COMMIT: $commit ==="
    Add-Content $outFile "git show --name-only $commit"
    git --no-pager show --name-only $commit | Add-Content $outFile
    Add-Content $outFile "`n"
}

clear
Write-Host "Análise salva em: $outFile"
```

#### Relatórios Estatísticos
```cmd
# Estatísticas por autor
git shortlog -sn --since="2025-09-01" --until="2025-09-30"

# Arquivos mais modificados
git log --since="2025-09-01" --until="2025-09-30" --name-only --pretty=format: | sort | uniq -c | sort -rn

# Commits por dia
git log --since="2025-09-01" --until="2025-09-30" --pretty=format:"%ad" --date=short | sort | uniq -c
```

## 📝 Padrões de Commit

### Tipos de Commit (SEM ACENTOS)

| Tipo | Descrição |
|------|-----------|
| **FEATURE** | Commit para adicionar um novo recurso ou funcionalidade ao sistema |
| **REFACTOR** | Refatoracao de codigo que nao corrige um bug nem adiciona um recurso |
| **FIX** | Corrige um bug |
| **DOCS** | Sem alteracoes apenas na documentacao |
| **STYLE** | Mudancas que nao afetam o significado do codigo (espacos, formatacao, etc.) |
| **PERF** | Uma mudanca de codigo que melhora a performance |
| **TEST** | Adicionando testes faltantes ou corrigindo testes existentes |
| **CHORE** | Atualizacoes de tarefas e arquivos de configuracao, pacotes etc., que nao modificam o codigo de producao ou de teste |
| **SECURITY** | Atualizacao que envolve a adequacao de seguranca ou LGPD |
| **CI** | Commits do tipo ci indicam mudancas relacionadas a integracao continua (continuous integration) |
| **RAW** | Commits do tipo raw indicam mudancas relacionadas a arquivos de configuracoes, dados, features, parametros |
| **CLEANUP** | Commits do tipo cleanup sao utilizados para remover codigo comentado, trechos desnecessarios ou qualquer outra forma de limpeza do codigo-fonte, visando aprimorar sua legibilidade e manutenibilidade |
| **REMOVE** | Commits do tipo remove indicam a exclusao de arquivos, diretorios ou funcionalidades obsoletas ou nao utilizadas, reduzindo o tamanho e a complexidade do projeto e mantendo-o mais organizado |
| **NEW APP** | Commit para a criacao de uma nova aplicacao ou projeto do zero |
| **BETA RELEASE** | Commit para o lancamento de uma nova versao beta |
| **STABLE RELEASE** | Commit para o lancamento de uma nova versao estavel |

### Exemplos de Commits

```bash
# Exemplos práticos
git commit -m "FEATURE: Adicionar integracao com API WhatsApp Business"
git commit -m "FIX: Corrigir erro de conexao com banco PostgreSQL"
git commit -m "REFACTOR: Melhorar estrutura dos workflows de automacao"
git commit -m "DOCS: Atualizar documentacao dos endpoints da API"
git commit -m "SECURITY: Implementar validacao de tokens JWT"
git commit -m "PERF: Otimizar consultas SQL do modulo de relatorios"
git commit -m "CHORE: Atualizar dependencias do Docker Compose"
git commit -m "CLEANUP: Remover codigo comentado dos workflows"
```

## 📁 Estrutura do Projeto

```
autohabilidade/
├── docker-compose.yml              # Configuração principal
├── docker-compose.production.yml   # Configuração produção
├── .env                           # Variáveis ambiente
├── setup.bat                      # Script configuração Windows
├── README.md                      # Esta documentação
├── INSTRUÇÕES_WINDOWS.md         # Guia específico Windows
└── server_n8n/                   # Dados e volumes
    ├── .n8n/                     # Dados principais n8n
    │   ├── workflows/            # Workflows salvos
    │   ├── credentials/          # Credenciais
    │   └── nodes/               # Nós customizados
    ├── shared/                   # Arquivos compartilhados
    │   ├── files/               # Arquivos para processar
    │   ├── templates/           # Templates
    │   ├── exports/             # Arquivos gerados
    │   └── imports/             # Arquivos de entrada
    ├── scripts/                  # Scripts personalizados
    ├── logs/                     # Logs aplicação
    ├── postgres_data/            # Dados PostgreSQL
    └── redis_data/               # Dados Redis
```

## 🔧 Configuração

### Variáveis de Ambiente (.env)
```env
# Autenticação
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=admin123

# Database
DB_TYPE=sqlite
POSTGRES_DB=n8n
POSTGRES_USER=n8n
POSTGRES_PASSWORD=n8n_password

# Redis
REDIS_PASSWORD=redis_password

# Timezone
GENERIC_TIMEZONE=America/Sao_Paulo
TZ=America/Sao_Paulo
```

### Portas Utilizadas
- **n8n Interface:** 5678
- **PostgreSQL:** 5432 (apenas desenvolvimento)
- **Redis:** 6379 (apenas desenvolvimento)

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças seguindo os padrões (`git commit -m 'FEATURE: Adicionar nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

### Convenções de Branch

- `main` - Branch principal (produção)
- `develop` - Branch de desenvolvimento
- `feature/nome-da-feature` - Novas funcionalidades
- `fix/nome-do-bug` - Correções
- `hotfix/nome-do-hotfix` - Correções urgentes

## 📞 Suporte

- **Documentação n8n:** [https://docs.n8n.io](https://docs.n8n.io)
- **Docker Desktop:** [https://docs.docker.com/desktop/](https://docs.docker.com/desktop/)
- **Issues do Projeto:** [Link para issues do repositório]

## 📄 Licença

Este projeto está sob a licença [TIPO_DE_LICENÇA]. Veja o arquivo `LICENSE` para mais detalhes.

---

**⚡ Desenvolvido para automatizar e otimizar processos empresariais**