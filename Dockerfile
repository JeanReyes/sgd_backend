# Usar la imagen oficial de MySQL
FROM mysql:8.0

# Establecer variables de entorno para la contraseña de root y el nombre de la base de datos
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes
ENV MYSQL_DATABASE=mi_base_de_datos

# Opcional: Añadir un script SQL para inicializar la base de datos
ADD sgd.sql /docker-entrypoint-initdb.d


# # Usar la imagen oficial de Maven con OpenJDK 11 como base
# FROM maven:3.8.1-openjdk-11 as build

# # Establecer el directorio de trabajo en /app
# WORKDIR /app

# # Copiar el pom.xml y descargar las dependencias para aprovechar la capa de caché de Docker
# COPY pom.xml .
# RUN mvn dependency:go-offline

# # Copiar el resto del código de la aplicación
# COPY src ./src

# # Compilar la aplicación
# RUN mvn package

# # Usar la imagen oficial de OpenJDK 11 para ejecutar la aplicación
# FROM openjdk:11-jre-slim

# # Copiar el archivo JAR de la aplicación desde la etapa de compilación
# COPY --from=build /app/target/sgd_backend-0.0.1-SNAPSHOT.jar /sgd_backend.jar

# # Exponer el puerto 8080
# EXPOSE 8080

# # Ejecutar la aplicación
# CMD ["java", "-jar", "/sgd_backend.jar"]