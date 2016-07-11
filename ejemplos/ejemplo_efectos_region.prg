// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_efectos_en_regiones;
begin
	set_title("Div GO : Ejemplo efectos en regiones");
	
	/* opciones de pantalla */
	set_mode(480, 240); //pone tamaño al canvas
	screen_color(#26b); //pone color

	set_fps(60, 0);		//pone los frames por segundo

	// define las regiones donde mostrar los graficos
	define_region(1, 0, 0, 480, 120);
	define_region(2, 0, 120, 480, 120);

	// inicia scroll
	start_scroll(0, 0, 1, 2, 1, 0);
	start_scroll(1, 0, 1, 2, 2, 0);
	
	flecha(3, 240, 60, 0, 2, 1);
	
	text_size = 50; // cambia la medida global de los textos
	text_color = cc_black; // cambia el color global de los textos
	write(0, 240, 20, 4, "Pulsa [0][1][2][3] para cambiar efectos a las regiones");
	
	// añade efectos a las regiones
	region_color(1, cc_orange); //region 1
	region_pixelated(2, 90); 	//region 2
	
    loop
    	if (key(_0))
    		region_color(1, cc_orange);
    		region_pixelated(2, 90);
        end
    	if (key(_1)) 
            region_wave(1, 0, 5, 10); 
            region_wave(2, 1, 10, 10); 
        end
        if (key(_2)) 
        	region_mask(1, 0, 7, 240, 60, 100, 100); 
            region_color(2, rgb_to_grb); 
        end
        if (key(_3)) 
        	region_blur(1, 20); 
            region_zoom(2, 240, 60, 100);
        end
        
    	frame;
    end
end

process flecha(graph, x, y, angle, region, cam);
begin
	size	= 100;
	ctype	= c_scroll;
	
    scroll[cam].camera = id;

	loop
		if (key(_up))	 y -= 2; angle = 90000;	 end
		if (key(_down))  y += 2; angle = -90000; end
		if (key(_left))  x -= 2; angle = 180000; end
		if (key(_right)) x += 2; angle = 0; 	 end
	
		frame;
	end
end
