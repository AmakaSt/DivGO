// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_constraint;
global
	id_txt; _id[9]; i;
		
begin
	/* pruebas con opciones de pantalla */
	set_mode(480, 320);
	screen_color(#424);

	set_fps(60, 0);
		
	_id[0] = nave(240, 200);
    
    for (i = 1; i < 9; i++)
    	_id[i] = paquete(240, 240*i);
    end
    
	loop
    	for (i = 1; i < 9; i++)
    		constraint(_id[i-1], 1, _id[i], 0, 40, 100);
		end
        
        if (key(_esc)) exit("Amaka Soft 2012", 0); end

		frame;
	end
end

process nave(x, y);	
begin
	graph = 3;
	size  = 50;
	angle = 90000;
	
	loop		
		if (key(_left))
			angle += 2000;
		end
		
		if (key(_right))
			angle -= 2000;
		end
		
		if (key(_up)) advance(2); end
		if (key(_down)) advance(-1); end
		
		frame;
	end
end

process paquete(x, y);
begin
	graph = 9;
    size  = 50;
    z	  = 15;
    
    loop
    
    	frame;
    end
end