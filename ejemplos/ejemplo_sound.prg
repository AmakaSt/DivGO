// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_sound;
global
    en_reproduccion, punto_pausado;
	sonido1, sonido2, sonido3, fuente1, fuente2;
	volumen = 512, frecuencia = 256;
	
begin
	sonido1 = load_sound("sonidos/inicia.ogg", 1);
	sonido2 = load_sound("sonidos/disparo.wav", 1);
	sonido3 = load_sound("sonidos/elimina.wav", 0);

	fuente1 = load_font("fuentes/LiquidCrystal-Normal.otf");
	fuente2 = load_font("fuentes/GridExercise-Bold.ttf");

	set_title("Div GO : Ejemplo de Sonido");

	/* pruebas con opciones de pantalla */
	set_mode(480, 240);
	screen_color(#240);

	sound(sonido1, volumen, frecuencia);
    sound(sonido2, 90, 200);
    sound(sonido3, 90, 200);

	set_fps(60, 0);
	
	text_color = #fff;
	text_size  = 50;
	write_int(fuente1, 240, 20, 4, offset en_reproduccion);
    write_int(fuente1, 460, 20, 5, offset volumen);
    write_int(fuente1, 460, 34, 5, offset frecuencia);

	text_color = #ccc;
	write(0, 240, 120, 4, "Pulsa [B] [N] o [M] para PARAR distinto sound");
	write(0, 240, 140, 4, "Pulsa [P] para PAUSAR y [C] para CONTINUAR reproducción");
    
	loop
    	en_reproduccion = is_playing_sound(sonido1);
		change_sound(sonido1, volumen, frecuencia);
		
        if (key(_b)) stop_sound(sonido1); end
		if (key(_n)) stop_sound(sonido2); end
        if (key(_m)) stop_sound(all_sound); end
		
        if (key(_up) and volumen < 512) volumen ++; end
     	if (key(_down) and volumen > 0) volumen --; end

        if (key(_right) and frecuencia < 512) frecuencia ++; end
     	if (key(_left) and frecuencia > 0) frecuencia --; end
		
        if (key(_p)) punto_pausado = pause_sound(sonido1); end
        if (key(_c)) continue_sound(sonido1, punto_pausado); end

		frame;
	end
end
