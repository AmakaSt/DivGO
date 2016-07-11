// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_rand;
global
	tiempo = 20;
	imagen = rand(1, 9);
	tamano = rand(40, 100);
	juego;

begin
	/* pruebas con opciones de pantalla */
	set_mode(480, 320);
	screen_color(#fff);

	set_fps(30,0); 
	
	text_color = rgb(0, 0, 0);
	write(0, 240, 20, 4, "Ejemplo con funcion aleatoria");

    switch(rand(0, 4))
    	case 1:  juego = "Panic!"; end
        case 2:  juego = "Bug Wars"; end
        case 3:  juego = "Jack The Nipper Remake"; end
        case 4:  juego = "Gamma Z"; end
        default: juego = "The Little Big Apple"; end
    end
    
    text_size = 50;
    write(0, 240, 50, 4, "Juego de Amaka Soft, al azar: " + juego);

	loop
		xput(0, imagen, mouse.x, mouse.y, rand(0, 360000), tamano, 0, 0);
		
		tiempo --; if (tiempo < 0) tiempo = 20; imagen = rand(1, 9); tamano = rand(40, 100); end
		if (mouse.left) tamano = 200; tiempo = 40; end
		
		if (key(_r)) clear_screen(); end

	frame;
	end
end
