// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_draw_xdraw;
global
	alto = 120;
	anima = 0;
	id_txt[2]; id1[2]; id2[999]; i;
    ampliar, oculta_contenido;

begin
	/* pruebas con opciones de pantalla */
	set_mode(m320x240);
	screen_color(#135);

	set_fps(30, 0);

	text_size = 50;
	id_txt[0] = write(0, 160, 20, 4, "Pulsa [1] [2] o [3] para borrar distinto dibujo");
	id_txt[1] = write(0, 160, 40, 4, "Pulsa [4] para dibujar xdraw y [5] borrarlos");
    id_txt[2] = write(0, 160, 220, 4, "Pulsa [6] para ocultar y [7] mostrar contenido");

	/* pruebas con draw */
	draw(1, #fff, 15, 0, 10, 10, 310, 10);
	draw(1, #fff, 15, 0, 10, 230, 310, 230);

	draw(3, #ff0, 3, 0, 30, 30, 50, 50);
	draw(3, #ff0, 6, 0, 35, 35, 50, 50);
	draw(3, #ff0, 9, 0, 40, 40, 50, 50);
	draw(3, #ff0, 12, 0, 45, 45, 50, 50);

	draw(5, #0f0, 3, 0, 240, 30, 50, 50);
	draw(5, #0f0, 6, 0, 235, 35, 50, 50);
	draw(5, #0f0, 9, 0, 230, 40, 50, 50);
	draw(5, #0f0, 8, 0, 225, 45, 50, 50);

	id1[0] = draw(2, #f00, 15, 0, 10, 120, 300, 80);
	id1[1] = draw(5, #00f, 7, 0, 100, 110, 110, alto);
	
	draw(4, #fff, 15, 0, 0, 0, 10, 10);
	draw(4, #fff, 15, 0, 310, 0, 10, 10);
	draw(4, #fff, 15, 0, 0, 230, 10, 10);
	draw(4, #fff, 15, 0, 310, 230, 10, 10);
	
	shadow_text(id_txt[0], #000, -1, 1, 1);
	shadow_text(id_txt[1], #000, -1, 1, 1);
    shadow_text(id_txt[2], #000, -1, 1, 1);
	shadow_draw(id1[1], #068, 0, 2, 3);
	gradient_draw(id1[1], #f0f, 0, 100, 0, 200);
	
    id1[2] = draw(3, #000, 15, 0, 0, 0, 320, 240);
    
	loop
		move_draw(id1[1], #00f, 7, 100, 110, 110, alto);
		subtract_draw(id1[2], 2, 160 - ampliar/2, 120 - ampliar/2, ampliar, ampliar);
        subtract_text(id_txt[1], 2, 160 - ampliar/2, 120 - ampliar/2, ampliar, ampliar);
		
		if (anima == 0) alto ++;
		else alto --; end

		if (alto > 120) anima = 1; end
		if (alto < 10) anima = 0; end
		
		if (key(_1)) delete_draw(id1[0]); end
		if (key(_2)) delete_draw(id1[1]); end
		if (key(_3)) delete_draw(all_drawing); end
        if (key(_4))
            delete_xdraw(all_xdrawing);
            
        	for (i = 0; i < 1000; i++)
				id2[i] = xdraw(0, rand(1, 9), rand(10, 310), rand(10, 230), rand(40, 80), 0, rand(40, 80), 0);
			end
        end
        if (key(_5))
        	for (i = 0; i < 1000; i++)
            	delete_xdraw(id2[i]);
            end
		end
        
        if (key(_6)) oculta_contenido = 1; end
        if (key(_7)) oculta_contenido = 0; end
        
        if (oculta_contenido == 0) 
        	ampliar += 4; if (ampliar > 400) ampliar = 400; end
        else
        	ampliar -= 4; if (ampliar < 0) ampliar = 0; end
        end

		frame;
	end
end
