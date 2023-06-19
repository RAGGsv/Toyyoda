drop database TOYYODABD;
create database TOYYODABD;
use toyyodabd
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[correo] [varchar](255) NOT NULL,
	[clave] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUsuario]    Script Date: 12/06/2023 20:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_RegistrarUsuario](
@Correo varchar(100),
@Clave varchar(500),
@Registrado bit output,
@Mensaje varchar(100) output
)
as
begin
	if (not exists(select * from USUARIO where correo = @Correo))
	begin
		insert into USUARIO (correo, clave) values (@Correo, @Clave)
		set @Registrado = 1
		set @Mensaje = 'usuario registrado'
	end
	else
	begin
		set @Registrado = 0
		set @Mensaje = 'correo ya existe'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarUsuario]    Script Date: 12/06/2023 20:55:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ValidarUsuario](
@correo varchar (100),
@clave varchar (500)
)
as 
begin
 if (exists(select* from usuario where correo=@Correo and clave=@Clave))
	select idUsuario from usuario where  correo=@Correo and clave=@Clave
	else
	select '0'
end
GO


-- Tabla pais
CREATE TABLE pais (
  idPais INT IDENTITY(1,1) PRIMARY KEY,
  nombrePais VARCHAR(50)
);

-- Tabla ciudad
CREATE TABLE ciudad (
  idCiudad INT IDENTITY(1,1) PRIMARY KEY,
  idPais INT,
  nombreCiudad VARCHAR(50),
  FOREIGN KEY (idPais) REFERENCES pais(idPais)
);

-- Tabla tipoDocumento
CREATE TABLE tipoDocumento (
  idTipoDocumento INT IDENTITY(1,1) PRIMARY KEY,
  tipoDocumento VARCHAR(50)
);

-- Tabla tipoCliente
CREATE TABLE tipoCliente (
  idTipoCliente INT IDENTITY(1,1) PRIMARY KEY,
  tipoCliente VARCHAR(50)
);

-- Tabla telefono
CREATE TABLE telefono (
  idTelefono INT IDENTITY(1,1) PRIMARY KEY,
  idPersona INT,
  telefono VARCHAR(50)
);

-- Tabla correo
CREATE TABLE correo (
  idCorreo INT IDENTITY(1,1) PRIMARY KEY,
  correoElectronico VARCHAR(100),
  idPersona INT
);

-- Tabla documento
CREATE TABLE documento (
  idDocumento INT IDENTITY(1,1) PRIMARY KEY,
  idTipoDocumento INT,
  numDocumento VARCHAR(50),
  idPersona INT,
  FOREIGN KEY (idTipoDocumento) REFERENCES tipoDocumento(idTipoDocumento)
);

-- Tabla direccion
CREATE TABLE direccion (
  idDireccion INT IDENTITY(1,1) PRIMARY KEY,
  idPais INT,
  idCiudad INT,
  idPersona INT,
  direccion VARCHAR(100),
  FOREIGN KEY (idPais) REFERENCES pais(idPais),
  FOREIGN KEY (idCiudad) REFERENCES ciudad(idCiudad),
);

-- Tabla persona
CREATE TABLE persona (
  idPersona INT IDENTITY(1,1) PRIMARY KEY,
  idDireccion INT,
  idTelefono INT,
  idCorreo INT,
  idDocumento INT,
  genero VARCHAR(10),
  primerNombre VARCHAR(50),
  segundoNombre VARCHAR(50),
  primerApellido VARCHAR(50),
  segundoApellido VARCHAR(50),
  FOREIGN KEY (idDireccion) REFERENCES direccion(idDireccion),
  FOREIGN KEY (idTelefono) REFERENCES telefono(idTelefono),
  FOREIGN KEY (idCorreo) REFERENCES correo(idCorreo),
  FOREIGN KEY (idDocumento) REFERENCES documento(idDocumento)
);

-- Tabla estadoCliente
CREATE TABLE estadoCliente (
  idEstadoCliente INT IDENTITY(1,1) PRIMARY KEY,
  estadoCliente VARCHAR(50),
  idCliente INT,
  
);

-- Tabla sucursal
CREATE TABLE sucursal (
  idSucursal INT IDENTITY(1,1) PRIMARY KEY,
  idPais INT,
  idCiudad INT,
  nombreSucursal VARCHAR(50),
  idCliente INT,
  FOREIGN KEY (idPais) REFERENCES pais(idPais),
  FOREIGN KEY (idCiudad) REFERENCES ciudad(idCiudad),
);

-- Tabla cliente
CREATE TABLE cliente (
  idCliente INT IDENTITY(1,1) PRIMARY KEY,
  idTipoCliente INT,
  idEstadoCliente INT,
  idSucursal INT,
  idPersona INT,
  FOREIGN KEY (idTipoCliente) REFERENCES tipoCliente(idTipoCliente),
  FOREIGN KEY (idEstadoCliente) REFERENCES estadoCliente(idEstadoCliente),
  FOREIGN KEY (idSucursal) REFERENCES sucursal(idSucursal),
  FOREIGN KEY (idPersona) REFERENCES persona(idPersona)
);



