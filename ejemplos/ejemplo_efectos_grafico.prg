// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_efectos_graficos;		
begin
	/* pruebas con opciones de pantalla */
	set_mode(480, 320);
	screen_color(#077);

	set_fps(60, 0);
		
	flecha(60, 120, 3); //sin efecto
    flecha(120, 120, color_in_map(0, 3, cc_red)); //cambio de color
    flecha(180, 120, color_in_map(0, 3, cc_green));
    flecha(240, 120, color_in_map(0, 3, cc_blue));
    flecha(300, 120, color_in_map(0, 3, cc_gray));
    flecha(360, 120, pixelated_in_map(0, 3, 90)); //pixelizado
    flecha(420, 120, blur_in_map(0, 3, 20)); //desenfocado
	flecha(240, 200, 0); //sin efecto valor 0
end

process flecha(x, y, effect);
private
	array, i;
	anima, ondear = 20;
	
begin
	graph = effect;
	size  = 50;
	angle = 90000;
    
	loop
    	if (effect == 0) 
        	graph = wave_in_map(0, 3, 0, 20, ondear);
            
            if (anima == 0)
            	ondear --; if (ondear < -20) anima = 1; end
            else
            	ondear ++; if (ondear > 20) anima = 0; end
            end
        end
		
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
