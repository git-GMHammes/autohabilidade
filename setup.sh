# Configurações do n8n
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=admin123

# Configurações de banco de dados
DB_TYPE=sqlite
# Para PostgreSQL (descomente as linhas abaixo e comente DB_TYPE=sqlite)
# DB_TYPE=postgresdb
# DB_POSTGRESDB_HOST=postgres
# DB_POSTGRESDB_PORT=5432
# DB_POSTGRESDB_DATABASE=n8n
# DB_POSTGRESDB_USER=n8n
# DB_POSTGRESDB_PASSWORD=n8n_password

# Configurações PostgreSQL
POSTGRES_DB=n8n
POSTGRES_USER=n8n
POSTGRES_PASSWORD=n8n_password

# Configurações Redis
REDIS_PASSWORD=redis_password

# Timezone
GENERIC_TIMEZONE=America/Sao_Paulo
TZ=America/Sao_Paulo

# Configurações de webhook e URL
WEBHOOK_URL=http://localhost:5678/
N8N_PROTOCOL=http
N8N_HOST=localhost
N8N_PORT=5678

# Configurações de execução
EXECUTIONS_PROCESS=main
EXECUTIONS_DATA_SAVE_ON_ERROR=all
EXECUTIONS_DATA_SAVE_ON_SUCCESS=all
EXECUTIONS_DATA_SAVE_MANUAL_EXECUTIONS=true

# Configurações de log
N8N_LOG_LEVEL=info
N8N_LOG_OUTPUT=console