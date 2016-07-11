// Pruebas de compilador online Div GO
// Php + Html5 + Canvas + Javascript + Three.js lib
// by J. Manuel Habas Millán

program ejemplo_mode7;
global
    ux = 0, uy = 0, tex;

begin
    set_title("Ejemplo Mode7");
   
    tex = load_fpg("graficos/texturas");
   
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

    // inicia mode7
    start_mode7(0, tex, 5, 4, 1, 60);
    start_mode7(1, tex, 1, 4, 2, 0);
   
    //m7[0].horizon = 10;
    m7[1].color      = #ff0;
    //m7[1].height  = 64;
   
    text_color	= rgb(0, 0, 0);
    text_size	= 60;
	write(0, 240, 210, 4, "+ / -: aleja / acerca la distancia");
    write(0, 240, 230, 4, "[cursores] para mover");
   
    text_color = rgb(255, 255, 255);
	write(0, 241, 209, 4, "+ / -: aleja / acerca la distancia");
    write(0, 241, 229, 4, "[cursores] para mover");

    flecha(1, ux, uy, 0);
    flecha(4, ux, uy, 1);
   
    estrella(120, 200);
    estrella(120, -200);
    estrella(240, 100);
   
    loop
        if (key(_c_minus)) m7[0].distance --; end
        if (key(_c_plus)) m7[0].distance ++; end

        if (key(_esc)) stop_mode7(0); stop_mode7(1); end
       
        frame;
    end
end

process flecha(graph, x, y, num);
begin
	write_int(0, 0, 0, 0, &angle);
    
	ctype = c_m7;
	alpha = 70;
	
	m7[num].camera = id;

    loop
        if (key(_up)) advance(8); end
        if (key(_down)) advance(-8); end
        if (key(_left)) angle -= 1000; end
        if (key(_right)) angle += 1000; end
   
        frame;
    end
end


process estrella(x, z);
begin
    graph     = 2;
    y         = 20;
    ctype     = c_m7;
   
    loop
   
        frame;
    end
end