// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_date_time;
global
	fecha, horario;
	dia, mes, anyo, segundos, minutos, horas;
	id_txt, fuente;
	
begin
	set_mode(m320x240);
	screen_color(#302);

	set_fps(30, 0);
	
	set_title("Div GO : Ejemplo de Fecha y Hora");

	fuente = load_font("fuentes/LiquidCrystal-Normal.otf");

    text_size  = 80;
    text_style = txt_paint_italic;
    id_txt = write(0, 160, 70, 4, "Ejemplo de Fecha y Hora");
    
    gradient_text(id_txt, #f00, 320, 0, 0, 0);
	shadow_text(id_txt, #836, 2, 2, 2);

	text_color = #ccc;
	text_size  = 100;
	write(0, 160, 119, 5, "Fecha: ");
	write(0, 160, 141, 5, "Hora: ");
	
	text_color = #fff;
	text_size  = 100;
	text_style = txt_paint_bold;
	write_int(fuente, 160, 119, 3, offset fecha);
	write_int(fuente, 160, 141, 3, offset horario);

	text_style = txt_paint_normal;
	write(0, 160, 180, 4, get_browser(b_os_name));

	dia   = date(d_day);
	mes   = date(d_month);
	anyo  = date(d_year);
	fecha = dia + "/" + mes + "/" + anyo; 
	
	loop
		//al añadir el time dentro del bucle actualiza dinamicamente
		segundos = time(t_seconds);
		minutos  = time(t_minutes);
		horas  	 = time(t_hours);
		horario  = horas + ":" + minutos + ":" + segundos;

		frame;
	end
end
