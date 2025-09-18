# Configuração n8n - Projeto Autohabilidade (Windows 10)

## 📁 Estrutura do Projeto

Na pasta raiz `autohabilidade\` você deve ter os seguintes arquivos e pastas:

```
autohabilidade\                    (pasta raiz do projeto)
├── docker-compose.yml             (configuração principal)
├── docker-compose.production.yml  (configuração de produção)
├── .env                          (variáveis de ambiente)
├── setup.bat                     (script de configuração)
├── INSTRUÇÕES_WINDOWS.md         (este arquivo)
├── README.md                     (documentação do projeto)
└── server_n8n\                  (pasta de dados - criada pelo setup.bat)
    ├── .n8n\                     (dados do n8n)
    ├── shared\                   (arquivos compartilhados)
    │   ├── files\               (arquivos para processar)
    │   ├── templates\           (templates)
    │   ├── exports\             (saídas)
    │   └── imports\             (entradas)
    ├── scripts\                  (scripts personalizados)
    ├── logs\                     (logs da aplicação)
    ├── postgres_data\            (dados PostgreSQL)
    └── redis_data\               (dados Redis)
```

## 🚀 Pré-requisitos Windows 10

### 1. Docker Desktop
- Baixe e instale: https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe
- **IMPORTANTE:** Certifique-se que o WSL2 está habilitado
- Configure Docker Desktop para iniciar com Windows

### 2. Verificar WSL2
```powershell
wsl --list --verbose
```
Se não tiver WSL2 instalado:
```powershell
wsl --install
```

## 📋 Configuração Inicial

### 1. Executar Setup
```cmd
# No prompt de comando (CMD) dentro da pasta autohabilidade
setup.bat
```

### 2. Verificar Docker Desktop
- Abra Docker Desktop
- Verifique se está rodando (ícone da baleia na barra de tarefas)
- Vá em Settings > Resources > File Sharing
- Certifique-se que o drive onde está o projeto está compartilhado

### 3. Iniciar os Containers

**Modo Desenvolvimento (SQLite):**
```cmd
docker-compose up -d
```

**Modo Produção (PostgreSQL + Redis):**
```cmd
docker-compose --profile production up -d
```

### 4. Verificar Status
```cmd
docker-compose ps
```

## 🌐 Acessar n8n

- **URL:** http://localhost:5678
- **Login:** admin
- **Senha:** admin123

## ⚠️ Particularidades do Windows

### 1. Permissões de Volume
- Windows usa permissões diferentes do Linux
- O Docker Desktop já gerencia isso automaticamente
- Não é necessário `chown` ou `chmod`

### 2. Paths nos Volumes
- Os paths nos volumes já estão configurados para Windows
- Docker Desktop converte automaticamente `\` para `/`

### 3. Firewall
Se tiver problemas de conexão:
```cmd
# Execute como Administrador
netsh advfirewall firewall add rule name="n8n" dir=in action=allow protocol=TCP localport=5678
```

### 4. Performance
Para melhor performance no Windows:
- Mantenha os dados na pasta do projeto (não em drives de rede)
- Use SSD se possível
- Configure Docker Desktop para usar mais recursos (Settings > Resources)

## 🔧 Comandos Úteis Windows

### Parar containers
```cmd
docker-compose down
```

### Ver logs
```cmd
docker-compose logs n8n
```

### Limpar dados (CUIDADO!)
```cmd
docker-compose down -v
rmdir /s server_n8n
```

### Backup dos dados
```cmd
# Backup completo da pasta
xcopy server_n8n backup_server_n8n /E /I /H /Y
```

### Restart do Docker Desktop
```cmd
# Se tiver problemas, restart o Docker Desktop
"C:\Program Files\Docker\Docker\Docker Desktop.exe" --quit
"C:\Program Files\Docker\Docker\Docker Desktop.exe"
```

## 📝 Troubleshooting Windows

### Erro "drive is not shared"
1. Docker Desktop > Settings > Resources > File Sharing
2. Adicione o drive onde está o projeto
3. Apply & Restart

### Erro "port already in use"
```cmd
# Verificar qual processo usa a porta
netstat -ano | findstr :5678
# Matar processo se necessário
taskkill /PID [PID_NUMBER] /F
```

### Erro de WSL2
```cmd
# Atualizar WSL2
wsl --update
# Reiniciar WSL2
wsl --shutdown
```

### Performance lenta
1. Docker Desktop > Settings > Resources
2. Aumentar Memory para 4GB+
3. Aumentar CPUs para 2+
4. Habilitar "Use the WSL 2 based engine"

## 🎯 Próximos Passos

1. Execute `setup.bat`
2. Execute `docker-compose up -d`
3. Acesse http://localhost:5678
4. Comece a criar seus workflows de automação!

Os arquivos ficarão disponíveis em `server_n8n\shared\` para suas automações processarem.