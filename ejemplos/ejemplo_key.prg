// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_key;
global
	posx = 320, posy = 200;
	tamano = 100;
	s_flags = 0;
	imagen = 9;
	angulo = 0;

begin
	/* pruebas con opciones de pantalla */
	set_mode(m640x400);
	screen_color(#333);

	set_fps(60, 0);

	text_color = #ff0;
	write(0, 320, 20, 4, "Prueba de teclado");
	write_int(0, 320, 45, 4, offset scan_code);
	
	loop
		//xput en pantalla con angle y size, flags
		xput(0, imagen, posx, posy, angulo, tamano, s_flags, 0);
	
		if (key(_left) and posx > 0) posx -= 3; end
		if (key(_right) and posx < 640) posx += 3; end
		if (key(_up) and posy > 0) posy -= 3; end
		if (key(_down) and posy < 400) posy += 3; end
		if (key(_z)) angulo += 5000; end
		if (key(_x)) angulo -= 5000; end
		if (key(_q) and tamano < 200) tamano += 2; end
		if (key(_a) and tamano > 20) tamano -= 2; end
		if (key(_w)) imagen ++; end
		if (key(_s)) imagen --; end
		if (key(_1)) s_flags = 0; end
		if (key(_2)) s_flags = 1; end
		if (key(_3)) s_flags = 2; end
		if (key(_4)) s_flags = 3; end
		if (key(_5)) s_flags = 4; end
		if (key(_6)) s_flags = 5; end
		if (key(_7)) s_flags = 6; end
		if (key(_8)) s_flags = 7; end
		
		if (imagen > 9) imagen = 1; end
		if (imagen < 1) imagen = 9; end

	frame;
	end
end
