// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_write;
global
	puntos = 0;
	energia = 100;

	gotas, grafico, fuente1, fuente2;
	
begin
	/* pruebas con opciones de pantalla */
	set_mode(m320x240);
	screen_color(#fb7);

	fuente1 = load_font("fuentes/LiquidCrystal-Normal.otf");
	fuente2 = load_font("fuentes/GridExercise-Bold.ttf");

	set_fps(30, 0);
	
	text_color = #000;
	text_size  = 100;
	text_style = txt_paint_italic; //tambien funciona con 1
	write(0, 160, 120, 4, "Funciones de Texto");
	
	text_color = #05a;
	text_size  = 100;
	text_style = txt_paint_normal; //tambien funciona con 0
	write_int(fuente1, 310, 20, 5, offset puntos);

	text_color = #05a;
	text_size  = 40;
	write(fuente2, 310, 35, 5, "puntos");

	text_color = #2b4;
	text_size  = 100;
	write_int(fuente1, 10, 20, 3, offset energia);

	text_color = #2b4;
	text_size  = 40;
	write(fuente2, 10, 35, 3, "energia");

	for (gotas = 0; gotas < 80; gotas ++)
		text_color = rgb(rand(0,255), rand(0,255), rand(0,255));
		text_size  = rand(50, 120);
		text_style = rand(0, 5);

		lluvia(rand(-10, 310), rand(0, -70), rand(2, 8));
	end

	loop
		puntos ++;
		energia --; if (energia < 0) energia = 100; end

		frame;
	end
end

process lluvia(x, y, velocidad);
begin
	graph 	= write_in_map(0, ">>zas>>", 4);
	fx 		= fx_lighter; //tambien funciona con 8
	angle 	= 280000;

	loop
		advance(velocidad); 
		
		if (y > 280) 
			y = -40; x = rand(-10, 310); 
			velocidad = rand(2, 8); 
		end
		
		frame;
	end
end
