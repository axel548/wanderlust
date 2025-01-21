# DevOps for WanderLust Proyect

Este proyecto es una implementación de DevOps que incluye pruebas del frontend, construcción y despliegue de imágenes Docker, configuración de infraestructura como código (IaC) con Terraform, actualización de aplicaciones en Kubernetes (EKS) y monitoreo con Prometheus y Grafana.

## Arquitecture
La arquitectura del proyecto se basa en los siguientes componentes clave:

- Frontend: La aplicación frontend se construye utilizando Docker y se despliega a un repositorio de Docker Hub.
- Backend: Similar al frontend, el backend se construye, etiqueta y despliega a Docker Hub.
- Kubernetes (EKS): Los despliegues y servicios de la aplicación se gestionan en un clúster de Kubernetes en AWS EKS.
- Infraestructura como Código (IaC): La infraestructura se gestiona con Terraform para asegurar una provisión y configuración coherente de recursos.
- Monitoreo: Se utilizan Prometheus y Grafana para el monitoreo de las métricas del sistema y de los contenedores.

![arquitectura](https://github.com/user-attachments/assets/c13a72e9-cd19-4a4c-bea3-7d0625f3e952)

