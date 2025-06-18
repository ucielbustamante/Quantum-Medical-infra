# Quantum Medical Infrastructure

> **Stack completo de despliegue** - Infraestructura containerizada para el sistema Quantum Medical con monitoreo, logs y herramientas de desarrollo.

## 🚀 ¿Qué incluye esta infraestructura?

Esta infraestructura proporciona un entorno completo de desarrollo y producción para el sistema Quantum Medical, incluyendo:

- **🏥 Backend API** (Node.js + Express)
- **🖥️ Frontend** (React/Vite)
- **🗄️ Base de datos** (PostgreSQL optimizada)
- **📊 Monitoreo** (Prometheus + Grafana)
- **📝 Logs centralizados** (Loki + Promtail)
- **🔧 Herramientas de desarrollo** (pgAdmin, Swagger UI)

## Arquitectura del Stack

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │    Backend      │    │   PostgreSQL    │
│   (React/Vite)  │◄──►│   (Node.js)     │◄──►│   (Database)    │
│   Port: 5173    │    │   Port: 5000    │    │   Port: 5432    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Swagger UI    │    │   Prometheus    │    │    pgAdmin      │
│   (API Docs)    │    │   (Metrics)     │    │   (DB Admin)    │
│   Port: 8080    │    │   Port: 9090    │    │   Port: 5050    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │    Grafana      │
                       │   (Dashboard)   │
                       │   Port: 3001    │
                       └─────────────────┘
                                ▲
                                │
                       ┌─────────────────┐
                       │     Loki        │
                       │   (Logs)        │
                       │   Port: 3100    │
                       └─────────────────┘
                                ▲
                                │
                       ┌─────────────────┐
                       │   Promtail      │
                       │ (Log Collector) │
                       └─────────────────┘
```

## 🚀 Despliegue Rápido

### 📋 Prerrequisitos

- **Docker** (v20.10+)
- **Docker Compose** (v2.0+)
- **Git** (para clonar repositorios)

### ⚡ Inicio Rápido

1. **Clonar repositorios**
   ```bash
   git clone <quantum-medical-backend>
   git clone <quantum-medical-frontend>
   git clone <quantum-medical-infrastructure>
   ```

2. **Configurar variables de entorno**
   ```bash
   cd Quantum-Medical-infrastructure
   cp .env.example .env
   # Editar .env con tus configuraciones
   ```

3. **Levantar toda la infraestructura**
   ```bash
   docker compose up --build -d
   ```

4. **¡Listo!** Accede a los servicios:
   - 🌐 **Frontend**: http://localhost:5173
   - 🔌 **Backend API**: http://localhost:5000
   - 📚 **Swagger Docs**: http://localhost:8080
   - 📊 **Grafana**: http://localhost:3001
   - 🗄️ **pgAdmin**: http://localhost:5050

## 🔧 Configuración Detallada

### 📝 Variables de Entorno

Crea un archivo `.env` en la raíz del proyecto:

```env
# ===== BASE DE DATOS =====
DB_USER=quantum_user
DB_PASS=quantum_password
DB_NAME=quantum_medical
DB_HOST=db
DB_PORT=5432

# ===== BACKEND =====
NODE_ENV=development
LOG_LEVEL=info
RUN_SEEDERS=true

# ===== FRONTEND =====
VITE_API_URL=http://localhost:5000
REACT_APP_API_URL=http://localhost:5000

# ===== GOOGLE OAUTH =====
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret

# ===== GOOGLE DRIVE =====
GOOGLE_DRIVE_CREDENTIALS=path/to/credentials.json

# ===== JWT =====
JWT_SECRET=your_jwt_secret_key

# ===== PGADMIN =====
PGADMIN_DEFAULT_EMAIL=admin@quantummedical.com
PGADMIN_DEFAULT_PASSWORD=admin_password

# ===== FRONTEND LOGS =====
FRONTEND_URL=http://localhost:5173
FRONTEND_KEY=your_frontend_key
```

### 🐳 Servicios del Docker Compose

#### **🏥 Backend API**
- **Puerto**: 5000
- **Contexto**: `../Quantum-Medical-backend`
- **Características**:
  - Hot reload para desarrollo
  - Health checks automáticos
  - Logs persistentes
  - Variables de entorno configurables

#### **🖥️ Frontend**
- **Puerto**: 5173
- **Contexto**: `../Quantum-Medical-frontend`
- **Características**:
  - Desarrollo con Vite
  - Hot reload automático
  - Configuración de API URL

#### **🗄️ PostgreSQL**
- **Puerto**: 5432
- **Versión**: 13
- **Optimizaciones**:
  - Pool de conexiones optimizado
  - Configuración de memoria ajustada
  - Health checks automáticos
  - Inicialización automática de datos

#### **📊 Monitoreo y Observabilidad**

##### **Prometheus**
- **Puerto**: 9090
- **Función**: Recolección de métricas del backend
- **Configuración**: `prometheus.yml`

##### **Grafana**
- **Puerto**: 3001
- **Función**: Dashboards y visualización
- **Características**:
  - Datasources pre-configuradas
  - Dashboards personalizados
  - Persistencia de datos

##### **Loki**
- **Puerto**: 3100
- **Función**: Agregación de logs
- **Configuración**: `loki-config.yml`

##### **Promtail**
- **Función**: Recolección de logs del backend
- **Configuración**: `promtail-config.yml`

#### **🔧 Herramientas de Desarrollo**

##### **pgAdmin**
- **Puerto**: 5050
- **Función**: Administración de PostgreSQL
- **Acceso**: Email/Password configurados en `.env`

##### **Swagger UI**
- **Puerto**: 8080
- **Función**: Documentación interactiva de la API
- **Especificación**: `swagger/openapi.json`

## 🚀 Comandos Útiles

### **Gestión de Servicios**
```bash
# Levantar todos los servicios
docker-compose up -d

# Ver logs en tiempo real
docker-compose logs -f

# Ver logs de un servicio específico
docker-compose logs -f backend

# Detener todos los servicios
docker-compose down

# Reconstruir y levantar
docker-compose up -d --build

# Reiniciar un servicio específico
docker-compose restart backend
```

### **Base de Datos**
```bash
# Acceder a PostgreSQL
docker-compose exec db psql -U quantum_user -d quantum_medical

# Ejecutar migraciones
docker-compose exec backend npm run migrate

# Ejecutar seeders
docker-compose exec backend npm run seed
```

### **Monitoreo**
```bash
# Ver métricas de Prometheus
curl http://localhost:9090/metrics

# Ver logs en Loki
curl http://localhost:3100/loki/api/v1/labels

# Acceder a Grafana
# http://localhost:3001 (admin/admin)
```

## 📊 Dashboards y Métricas

### **Grafana Dashboards Disponibles**
- **Backend Metrics**: Métricas de rendimiento de la API
- **Database Stats**: Estadísticas de PostgreSQL
- **Application Logs**: Logs centralizados de la aplicación
- **System Health**: Estado general del sistema

### **Métricas Recolectadas**
- **HTTP Requests**: Latencia, throughput, códigos de estado
- **Database**: Conexiones, queries, performance
- **System**: CPU, memoria, disco
- **Application**: Logs estructurados, errores

## 🔍 Troubleshooting

### **Problemas Comunes**

#### **Backend no inicia**
```bash
# Verificar logs
docker-compose logs backend

# Verificar conectividad con DB
docker-compose exec backend ping db
```

#### **Base de datos no responde**
```bash
# Verificar estado del contenedor
docker-compose ps db

# Verificar logs de PostgreSQL
docker-compose logs db
```

#### **Frontend no carga**
```bash
# Verificar variables de entorno
docker-compose exec frontend env | grep VITE

# Verificar conectividad con backend
docker-compose exec frontend curl backend:5000
```

### **Logs y Debugging**
```bash
# Ver todos los logs
docker-compose logs

# Ver logs de un servicio específico
docker-compose logs [service-name]

# Seguir logs en tiempo real
docker-compose logs -f [service-name]
```

## 👥 Equipo de Desarrollo

### 🧑‍💻 Desarrolladores

| **Uciel Bustamante** | **Nahuel Martínez** | **Micaela Galeano** | **Juan Iturrart** |
|:---:|:---:|:---:|:---:|
| Tech Lead | Backend Developer | Frontend Developer | Frontend Engineer |
| [📧 Contact](mailto:ucibustamante.a@gmail.com) | [📧 Contact](mailto:martinezsnahu@gmail.com) | [📧 Contact](mailto:galeano94mica@gmail.com) | [📧 Contact](mailto:juaniturrart588@gmail.com) | 
[📘 LinkedIn](https://www.linkedin.com/in/uciel-bustamante/) | [📘 LinkedIn](https://www.linkedin.com/in/nahuel-martinez-7b898a218/) | [📘 LinkedIn](https://www.linkedin.com/in/micaela-alejandra-galeano) | [📘 LinkedIn](https://www.linkedin.com/in/juan-ignacio-iturrart-06027b284/) |

### 🤝 Contribuciones

Este proyecto es el resultado del trabajo colaborativo del equipo de desarrollo, donde cada miembro aportó su experiencia y conocimientos para crear una solución integral de gestión médica.

---

**Desarrollado con ❤️ por el equipo de Quantum Medical**