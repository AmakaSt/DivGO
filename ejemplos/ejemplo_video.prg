// Ejemplo de compilador online Div GO: Games Online
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_video;
global
	media, id_peli, punto_pausado, tiempo, en_reproduccion;
	volumen = 512, frecuencia = 256;

loading
    set_mode(m320x240, 2);
	screen_color(#000);

	set_title("Div GO : Cargando Video...");

	graph = 10;
    size = 50;
    x = 160;
    y = 120;
    speed = -1;

begin
	set_fps(30, 0);
	set_title("Div GO : Ejemplo de Manejo de Videos");

	media = load_video("videos/trailer.mp4", 0);
	
	video(media, 256, 256);
	id_peli = video(media, 256, 256);

	//move_video(id, flags, angle, alpha, x, y, ancho, alto, region)
	move_video(id_peli, 1, 180000, 20, 0, 300, 320, 120, 0);

    text_size  = 50;
	text_color = #fff;
    write(0, 160, 220, 4, "Pulsa Espacio para Pausar y Enter para Continuar");
	
	text_color = #000;
	write_int(0, 5, 5, 0, offset en_reproduccion);
    
	write_int(0, 160, 5, 1, offset tiempo);
    write(0, 160, 18, 1, get_video_length(media));
    
    write_int(0, 315, 5, 2, offset volumen);
    write_int(0, 315, 18, 2, offset frecuencia);
	 	
	loop
    	tiempo = get_video_playtime(media);
		en_reproduccion = is_playing_video(media); //funciona igual que is_playing_sound()
		
		change_video(media, volumen, frecuencia);

        if (key(_up) and volumen < 512) volumen ++; end
     	if (key(_down) and volumen > 0) volumen --; end

        if (key(_right) and frecuencia < 512) frecuencia ++; end
     	if (key(_left) and frecuencia > 0) frecuencia --; end

		if (key(_space)) punto_pausado = pause_video(media); end
		if (key(_enter)) continue_video(media, punto_pausado); end
		if (key(_esc)) stop_video(media); end

		if (key(_1)) set_mode(m320x240, view_full_aspect_ratio); end
		if (key(_2)) set_mode(m320x240, view_full_size_scale); end
		if (key(_3)) set_mode(m320x240); end

		frame;
	end
end