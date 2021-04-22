
go
create procedure InsertarUsuarios

@ID_Usuario int,
@Nombres varchar(50),
@usuario varchar (50),
@Contraseña varchar(50),
@tipo_usuario varchar(50)
AS 
BEGIN
insert into Usuarios (ID_Usuario,Nombres,usuario,Contraseña,tipo_usuario)
values (@ID_Usuario,@Nombres,@usuario,@Contraseña,@tipo_usuario);
end 

