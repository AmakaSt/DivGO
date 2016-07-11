// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_advance;
global
	id_txt;
		
begin
	/* pruebas con opciones de pantalla */
	set_mode(480, 320);
	screen_color(#424);

	set_fps(60, 0);
	
	text_color = #ccc;
	id_txt = write(0, 240, 90, 4, "Pulsa ESPACIO para disparar");
	
	nave(240, 200);
	
	loop		
		if (key(_esc)) exit("Amaka Soft 2012", 1); end

		frame;
	end
end

process nave(x, y);
private
	disparado;
	
begin
	graph = 3;
	size  = 50;
	angle = 90000;
	
	loop		
		if (key(_left) || pad.stick1.left > 10)
			angle += 2000 + (pad.stick1.up*100);
		end
		
		if (key(_right) || pad.stick1.right > 10)
			angle -= 2000 - (pad.stick1.up*100);
		end
		
		if (key(_up) || pad.stick1.up > 20) advance(2 + (pad.stick1.up/20)); end
		if (key(_down) || pad.stick1.down > 20) advance(-1 - (pad.stick1.down/20)); end
		
		if ((key(_space) || pad.button0) and disparado < 1)
			disparo(x, y, angle);
			disparado = 5; delete_text(id_txt);
		end
				
		disparado --; if (disparado < 0) disparado = 0; end
		
		frame;
	end
end

process disparo(x, y, angle);
begin
	graph = 3;
	size  = 15;
	z	  = 10;
	advance(20);
	
	loop
		advance(10);
		
		if (out_region(id, 0)) break; end
		
		frame;
	end
end
