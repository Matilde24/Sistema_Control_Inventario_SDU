

create proc ActualizarUsuarios
(
@ID_Usuario int,
@Nombres varchar(50),
@usuario varchar (50),
@Contraseña varchar(50),
@tipo_usuario varchar(50)

)
as
update Usuarios set ID_Usuario=@ID_Usuario, Nombres=@Nombres, usuario=@usuario 
Where ID_Usuario=@ID_Usuario
