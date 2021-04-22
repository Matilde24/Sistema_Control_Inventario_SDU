

-------------------Eliminar

create proc EliminarUsuarios
(
@ID_Usuario int 

)
as
delete from Usuarios where ID_Usuario=@ID_Usuario