// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

PROGRAM ejemplo_fget_dist_y_fget_angle;
GLOBAL
    coordenada_x0; coordenada_y0;
    coordenada_x1; coordenada_y1;
    resultado0;
    resultado1;
	pulsado;

BEGIN
	text_size = 40;
    write(0, 0, 0, 0, "Coordenadas punto 1");
    write(0, 0, 10, 0, "X:");
    write_int(0, 20, 10, 0, offset coordenada_x0);
    write(0, 0, 20, 0, "Y:");
    write_int(0, 20, 20, 0, offset coordenada_y0);
    write(0, 0, 40, 0, "Coordenadas punto 2");
    write(0, 0, 50, 0, "X:");
    write_int(0, 20, 50, 0, offset coordenada_x1);
    write(0, 0, 60, 0, "Y:");
    write_int(0, 20, 60, 0, offset coordenada_y1);
    write(0, 0, 80, 0, "Distancia entre el punto 1 y el punto 2");
    write_int(0, 0, 90, 0, offset resultado0);
    write(0, 0, 110, 0, "Angulo entre el punto 1 y el punto 2");
    write_int(0, 0, 120, 0, offset resultado1);
	write(0, 320, 360, 7, "Pulsa [ESPACIO] o haz [TOUCH] en la pantalla para hallar otra distancia y angulo.");
    
    LOOP
		if (key(_space) or (mouse.left and mouse.x<640 and mouse.y<480))
			if (pulsado < 1)
				clear_screen();
				coordenada_x0=rand(0, 640);
				coordenada_y0=rand(0, 360);
				coordenada_x1=rand(0, 640);
				coordenada_y1=rand(0, 360);
				put(0,1,coordenada_x0, coordenada_y0);
				put(0,2,coordenada_x1, coordenada_y1);
				
				//Hallamos la distancia que hay entre los dos puntos
				resultado0 = fget_dist(coordenada_x0, coordenada_y0, coordenada_x1, coordenada_y1);
				//Hallamos el angulo que hay entre los dos puntos
				resultado1 = fget_angle(coordenada_x0, coordenada_y0, coordenada_x1, coordenada_y1);
			end

			pulsado = 1;
       	else
			pulsado = 0;
		end


		FRAME;
    END
END