// Pruebas de compilador online Div GO
// Php + Html5 + Canvas + Javascript + Three.js lib
// by J. Manuel Habas Millán

program ejemplo_3d;
global
    tex, obj1, obj2, luz1, luz2;

private
    uz = 200, ang = 0, fig1, fig2;

begin
    tex = load_fpg("graficos/texturas");
   
    set_mode(640, 400);
    screen_color(#424);

    set_fps(60, 0);
   
    text_color = #ccc;
    text_size  = 50;
   
    write(0, 5, 10, 3, "CURSORES: moverte por el escenario");
    write(0, 5, 30, 3, "Y: crea objetos 3d");
    write(0, 5, 50, 3, "Z: elimina objetos 3d");
    write(0, 5, 70, 3, "+ / -: enciende / apaga luz ambiental");
   
    define_region(1, 0, 0, 640, 200);
    define_region(2, 0, 200, 640, 200);
   
    //inicia scene3d sin esto no funcionaran las funciones object3d() ni light3d()
    start_scene3d(0, tex, 1, 1); //numero, file, graph, ancho, alto, region
    start_scene3d(1, tex, 1, 2); //numero, file, graph, ancho, alto, region
   
    //crea objetos en escena
    obj1 = object3d(1, 1, #ff0, 100, 0, -100, 50, 200); //tipo, wireframe, color, alpha, trazado, x, y, z
    obj2 = object3d(2, 1, #000, 100, 1, 100, 50, 200);  //tipo, wireframe, color, alpha, trazado, x, y, z

    //carga y crea modelo 3d en escena
    fig1 = load_object3d("objetos3d/male02.obj", 0, #fff, 0, 0, 500); //archivo, wireframe, color, x, y, z
    fig2 = load_object3d("objetos3d/monster.dae", 0, #fff, 0, 0, 0);  //archivo, wireframe, color, x, y, z

    move_object3d(fig2, 0, 0, 200, 90000, 0, 0); //id, x, y, z, angle_x, angle_y, angle_z

    //aplica una textura a objeto
    texture_in_object3d(obj1, tex, 4); //id, file, graph
    texture_in_object3d(obj2, tex, 2); //id, file, graph
    texture_in_object3d(fig2, tex, 3); //id, file, graph

    //modifica el ancho, alto o largo de los objetos
    //modify_object3d(obj1, 50, 100, 200, 100); //id, alpha, ancho, alto, largo
    modify_object3d(fig1, 60, 100, 100, 100);
    modify_object3d(fig2, 100, 1000, 1000, 1000);

    //crea luces en escena
    luz1 = light3d(100, rgb(200, 200, 255), 10000, 100, 100, -100); //intensidad, color, distancia, x, y, z
    luz2 = light3d(200, rgb(0, 255, 128), 1000, -100, 200, -100);
   
    jugador(0, 100, 200, 0); //x, y, z
    //jugador(0, 100, 200, 1); //x, y, z
    jugador2(0, 100, -200, 1); //x, y, z
   
    scene3d.light = 0;
    scene3d.alpha = 100;
    scene3d[1].light = 0;
    scene3d[1].alpha = 50;
   
	loop
        ang += 400;
        //uz ++;
       
        move_object3d(obj1, -100, 50, uz, 0, ang, 0); //id, x, y, z, angle_x, angle_y, angle_z
        move_light3d(luz2, 200, -100, 200, uz - 100); //id, intensidad, x, y, z
     
        if (key(_z)) delete_object3d(all_object3d); end
        if (key(_y)) object3d(rand(0, 4), rand(0, 1), rgb(rand(0,255), rand(0,255), rand(0,255)), rand(0, 100), 0, rand(-200, 200), rand(0, 250), rand(-200, 200)); end
       
        if (key(_c_minus) and scene3d.light > 0)    scene3d.light --; end
        if (key(_c_plus) and scene3d.light < 200)     scene3d.light ++; end
               
        if (key(_esc)) exit("Amaka Soft 2015", 1); end
       
        frame;
    end
end

process jugador(x, y, z, num);   
begin
	ctype = c_scene3d;
    scene3d[num].camera = id;

	loop
        if (key(_left)) angle -= 1000; end
        if (key(_right)) angle += 1000; end
       
        if (key(_up)) advance(10); end
        if (key(_down)) advance(-8); end

        frame;
    end
end

process jugador2(x, y, z, num);   
begin
	ctype = c_scene3d;
    scene3d[num].camera = id;
	
	loop       
        if (key(_a)) angle -= 1000; end
        if (key(_d)) angle += 1000; end
        if (key(_w)) advance(10); end
        if (key(_s)) advance(-8); end
       
        frame;
	end
end