CREATE TABLE USUARIO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nick VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    estado INT NOT NULL,
    fechaCreacion TIMESTAMP NOT NULL,
    role VARCHAR(255) NOT NULL,
    CHECK (role IN ('ROLE_USER', 'ROLE_ADMIN'))
    -- Aquí puedes agregar otras columnas según sea necesario
);

INSERT INTO USUARIO (nick, password, estado, fechaCreacion, role) 
VALUES ('jreyesalvarez18', '12345', 1, NOW(), 'ROLE_USER');