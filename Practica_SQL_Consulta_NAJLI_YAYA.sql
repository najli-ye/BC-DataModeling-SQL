-- PRACTICA SQL NAJLI YAYA ESTEVEZ (BOOTCAMP BIG DATA)

-- CONSULTA SQL

select c.nombre_modelo as modelo,
		b.nombre_marca as marca,
		a.nombre_grupoempresarial as grupo_empresarial,
		d.fecha_compra,
		d.matricula,
		e.nombre_color as color,
		d.kilometraje as kilometros_totales,
		f.nombre_aseguradora as empresa_aseguradora,
		d.num_poliza as numero_poliza
		
		
from practica_sql_nye.gruposempresariales a inner join practica_sql_nye.marcas b on a.idgempresarial = b.idgempresarial
											inner join practica_sql_nye.modelos c on b.idmarca = c.idmarca
											inner join practica_sql_nye.vehiculos d on c.idmodelo = d.idmodelo
											inner join practica_sql_nye.colores e on d.idcolor = e.idcolor
											inner join practica_sql_nye.companiasaseguradoras f on d.idaseguradora = f.idaseguradora
											
where d.fecha_baja = '4000-01-01' 
;






