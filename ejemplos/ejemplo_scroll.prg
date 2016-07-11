// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_scroll;
global
	ux = 240, uy = 60;

begin
	set_title("Div GO : Ejemplo Scroll");
	
	/* pruebas con opciones de pantalla */
	set_mode(480, 240);
	screen_color(#26b);

	set_fps(60, 0);

	xput(0, 4, 80, 0, 0, 140, 0, 0);
	xput(0, 4, 160, 20, 0, 160, 0, 0);
	xput(0, 4, 300, 0, 0, 140, 0, 0);
	xput(0, 4, 400, 20, 0, 160, 0, 0);

	xput(0, 4, 400, 240, 180000, 140, 0, 0);
	xput(0, 4, 300, 220, 180000, 160, 0, 0);
	xput(0, 4, 160, 240, 180000, 140, 0, 0);
	xput(0, 4, 80, 220, 180000, 160, 0, 0);

	// definimos las regiones donde mostrar los graficos
	define_region(1, 0, 0, 480, 120);
    define_region(2, 0, 120, 480, 120);
    define_region(3, 0, 0, 480, 240);

	// inicia scroll
	start_scroll(0, 0, 1, 5, 1, 0);
	start_scroll(1, 0, 1, 5, 2, 0);
		
    text_color	  = rgb(0, 0, 0);
    text_size	  = 45;
    
    write(0, 40, 26, 4, "1 Player");
    write(0, 40, 146, 4, "2 Player");

    text_color	  = rgb(0, 0, 0);
    text_size	  = 60;
    write(0, 240, 110, 4, "[cursores] para mover");
    write(0, 240, 230, 4, "[o, p, q, a] para mover");
    
    text_color	  = rgb(255, 255, 255);
    write(0, 241, 109, 4, "[cursores] para mover");
    write(0, 241, 229, 4, "[o, p, q, a] para mover");

   	bocadillo(7, 40, 30, 50);
    bocadillo(7, 40, 150, 50);
    
    estrella(2, 90, uy, 50);
	flecha(3, ux, uy, 0);	
    
	loop		
		if (key(_1) and scroll.alpha0 > 0) scroll.alpha0 -= 2; end
		if (key(_2) and scroll.alpha0 < 100) scroll.alpha0 += 2; end
		if (key(_4) and scroll.alpha1 > 0) scroll.alpha1 -= 2; end
		if (key(_5) and scroll.alpha1 < 100) scroll.alpha1 += 2; end
		
		if (key(_enter)) start_scroll(0, 0, 1, 2, 1, 0); end
		if (key(_esc)) stop_scroll(0); end
		
		frame;
	end
end

process flecha(graph, x, y, angle);
begin
	size  = 50;
	ctype = c_scroll;
	
	scroll[0].camera = id;
    
	loop
		if (key(_up))
			y-=3;
			angle = 90000;
		end
		
		if (key(_down))
			y+=3;
			angle = -90000;
		end
		
		if (key(_left))
			x-=3;
			angle = 180000;
		end
		
		if (key(_right))
			x+=3;
			angle = 0;
		end
	
		frame;
	end
end

process estrella(graph, x, y, size)
begin
	ctype = c_scroll;
	
	scroll[1].camera = id;

    loop

		if (key(_q)) y-=3; end		
		if (key(_a)) y+=3; end		
		if (key(_o)) x-=3; end
		if (key(_p)) x+=3; end

    	frame;
    end
end

process bocadillo(graph, x, y, size)
begin
    region = 3;
    
    loop

    	frame;
    end
end
