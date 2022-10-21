Select * from tabla;

Alter table tabla
	Add Status bit default 1;
	
Describe Table

Delimiter =)
Create procedure sp_GestionTabla
(
	paccion  tinyint,
	ptable_id  smallint,
	pfirst_name  varchar(45),
	plast_name  varchar(45)
)
BEGIN
	declare hoy  datetime;
	set hoy  = now();
	
	If paccion= 1 then
		Insert into tabla(first_name, last_name)
			Values(pfirst_name, plastname);
	elseif paccion = 2 then
		Update tabla
			Where table_id=ptable_id;
	elseif paccion= 3 then
		Update tabla
			Set status=0
			Where table_id=ptable_id;
	elseif paccion=4 then
		Delete from tabla
			Where table_id=ptable_id;
	elseif paccion= 5 then
		Select tabla
			Where table_id=ptable_id;
	END IF;
			
END =)
Delimiter ;

call sp_GestionTabla();
