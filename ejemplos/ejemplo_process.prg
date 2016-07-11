// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_process;
global
	textos[7]; txt = 0;
	
begin
	set_title("Div GO : Ejemplo de procesos");

	/* pruebas con opciones de pantalla */
	set_mode(480, 320);
	screen_color(#025);

	set_fps(60, 0);

	// inicia scroll
	start_scroll(0, 0, 2, 2, 0, 0);

	scroll.alpha0 = 50;
	scroll.alpha1 = 20;
	
	text_color = #fff;
	text_size  = 50;
	write(0, 237, 20, 5, "nº de procesos:");
	write_int(0, 243, 20, 3, offset num_process);
	
	text_color = #ccc;
	textos[0] = write(0, 10, 90, 3, "Pulsa SPACE para disparar");

	text_color = #aaa;
	textos[1] = write(0, 10, 105, 3, "Pulsa R para borrar procesos");
	textos[2] = write(0, 10, 120, 3, "Pulsa Q para despertar proceso disparo");
	textos[3] = write(0, 10, 135, 3, "Pulsa W para despertar proceso disparo e hijos");	
	textos[4] = write(0, 10, 150, 3, "Pulsa A para quitar proceso disparo");
	textos[5] = write(0, 10, 165, 3, "Pulsa S para quitar proceso disparo e hijos");
	textos[6] = write(0, 10, 180, 3, "Pulsa Z para congelar proceso disparo");
	textos[7] = write(0, 10, 195, 3, "Pulsa X para congelar proceso disparo e hijos");
	
	nave(240, 290);
	
	loop
		scroll.y0 += 2;
		scroll.y1 += 1;
		
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
		if ((key(_left) or pad.stick1.left > 20) and x > 20)
			scroll.x0 += 2;
			scroll.x1 += 1;
            x -= 3;
		end
		
		if ((key(_right) or pad.stick1.right > 20) and x < 460)
			scroll.x0 -= 2;
			scroll.x1 -= 1;
            x += 3;
		end
		
		if ((key(_space) or pad.button0) and disparado < 1)
			for (txt = 0; txt < 8; txt ++) delete_text(textos[txt]); end
			disparo(x, y-20);
			disparado = 5;
		end
		
		//borra todos los procesos excepto este
		if (key(_r)) let_me_alone(); end
		if (key(_q)) signal(type disparo, s_wakeup); end
        if (key(_w)) signal(type disparo, s_wakeup_tree); end
        if (key(_a)) signal(type disparo, s_kill); end
		if (key(_s)) signal(type disparo, s_kill_tree); end
        if (key(_z)) signal(type disparo, s_freeze); end
        if (key(_x)) signal(type disparo, s_freeze_tree); end
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
		
        explosion(x, y+10);
		frame;
	end
end

process explosion(x, y);
begin
	graph = 1;
    size  = 10;
    z 	  = 20;
    alpha = 70;
    
    loop
    	
        angle = rand(0, 360000);
        size ++;
        alpha -= 3; if (alpha < 5) break; end
        
        frame;
    end
end