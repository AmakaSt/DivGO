// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_collision;
global
	id_txt1, id_txt2;
	puntos = 0;
	sonido1, sonido2, sonido3;
	
begin
	sonido1 = load_sound("sonidos/inicia.ogg", 0);
	sonido2 = load_sound("sonidos/disparo.wav", 0);
	sonido3 = load_sound("sonidos/elimina.wav", 0);

	set_title("Div GO : Ejemplo de Colisiones");

	/* pruebas con opciones de pantalla */
	set_mode(480, 320);
	screen_color(#025);

	set_fps(60, 0);

	// inicia scroll
	start_scroll(0, 0, 2, 2, 0, 0);
	start_scroll(1, 0, 2, 2, 0, 0);

	scroll[0].alpha0 = 20; scroll[0].alpha1 = 10;
	scroll[1].alpha0 = 80; scroll[1].alpha1 = 40;
	
	text_color = #fff;
	text_size  = 50;
	id_txt1 = write_int(0, 240, 20, 4, offset puntos);
	
	text_color = #ccc;
	id_txt2 = write(0, 240, 90, 4, "Pulsa [B] [N] o [M] para disparar");
	
	shadow_text(id_txt1, #000, 1, 1, 2);
	shadow_text(id_txt2, #000, 1, 1, 2);
	
	nave(240, 290);
	enemigo();
	
	loop
		scroll[0].y0 += 0.5; scroll[0].y1 += 0.25;
		scroll[1].y0 += 2; scroll[1].y1 += 1;
		
		if (key(_esc)) exit("Amaka Soft 2012", 1); end

		frame;
	end
end

process nave(x, y);
private
	disparado;
	
begin
	graph = 6;
	size  = 50;
	
	loop		
		if (key(_left) and x > 20)
			scroll.x0 += 0.5; scroll.x1 += 0.25;
			scroll[1].x0 += 2; scroll[1].x1 += 1;
            x -= 3;
		end
		
		if (key(_right) and x < 460)
			scroll.x0 -= 0.5; scroll.x1 -= 0.25;
			scroll[1].x0 -= 2; scroll[1].x1 -= 1;
            x += 3;
		end

		if (mouse.left and mouse.x < x and x > 20)
			scroll.x0 += 0.5; scroll.x1 += 0.25;
			scroll[1].x0 += 2; scroll[1].x1 += 1;
            x -= 3;
		end
		
		if (mouse.left and mouse.x > x and x < 460)
			scroll.x0 -= 0.5; scroll.x1 -= 0.25;
			scroll[1].x0 -= 2; scroll[1].x1 -= 1;
            x += 3;
		end

		if (((key(_b) or key(_n) or key(_m)) 
        	or (mouse.left and mouse.x < 480 and mouse.y < 320)) and disparado < 1)
			disparo(x, y-20); sound(sonido2, 200, 256);
			disparado = 5;
			delete_text(id_txt2);
		end
			
		disparado --; if (disparado < 0) disparado = 0; end
		
		frame;
	end
end

process disparo(x, y);
begin
	graph = 3;
	angle = 90000;
	size  = 15;
	z	  = 10;
	
	loop
		y -= 5; if (y < -10) break; end
		
		frame;
	end
end

process enemigo();
private
	desformacion, anima;
	energia_enemigo = 5;
    id_disp;
	
begin
	graph = 5;
	x 	  = rand(0, 480)
	y	  = -50;
	size  = rand(60, 110);
	
	sound(sonido1, 100, 256);
	
	loop
    	if (desformacion == 0)
        	shear_x += 4; if (shear_x > 50) desformacion = 1; end
        else
        	shear_x -= 4; if (shear_x < -50) desformacion = 0; end
        end

		y+= 5; if (y > 100) y = 100; end
		if (anima == 0) 
			x-=2; if (x <0) anima = 1; end
		end
		
		if (anima == 1) 
			x+=2; if (x >480) anima = 0; end
		end		
		
		if (anima == 2)
			size -= 5; if (size < 0) puntos += 100; enemigo(); break; end
		end
		
        id_disp = collision(type disparo);
		if (id_disp) 
			puntos += 5; energia_enemigo --;
			signal(id_disp, s_kill);
		end
		
		if (energia_enemigo < 0 and anima <> 2) anima = 2; sound(sonido3, 200, 256); energia_enemigo = 0; end 
		
		frame;
	end
end