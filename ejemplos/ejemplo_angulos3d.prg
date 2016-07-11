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
    write(0, 5, 30, 3, "MOUSE: mover el punto de vista");

    //inicia scene3d sin esto no funcionaran las funciones object3d() ni light3d()
    start_scene3d(0, tex, 3, 0); //numero, file, graph, ancho, alto, region
   
    //crea objetos en escena
    obj1 = object3d(1, 1, #ff0, 100, 0, -100, 50, 200); //tipo, wireframe, color, alpha, trazado, x, y, z
    obj2 = object3d(2, 1, #000, 100, 1, 100, 50, 200);  //tipo, wireframe, color, alpha, trazado, x, y, z

    //carga y crea modelo 3d en escena
    fig2 = load_object3d("objetos3d/monster.dae", 0, #fff, 0, 0, 0);  //archivo, wireframe, color, x, y, z

    move_object3d(fig2, 0, 0, 200, 90000, 0, 0); //id, x, y, z, angle_x, angle_y, angle_z

    //aplica una textura a objeto
    texture_in_object3d(obj1, tex, 4); //id, file, graph
    texture_in_object3d(obj2, tex, 2); //id, file, graph
    texture_in_object3d(fig2, tex, 3); //id, file, graph

    //modifica el ancho, alto o largo de los objetos
    modify_object3d(fig2, 100, 1000, 1000, 1000);

    //crea luces en escena
    luz1 = light3d(100, rgb(200, 200, 255), 10000, 100, 100, -100); //intensidad, color, distancia, x, y, z
    luz2 = light3d(200, rgb(0, 255, 128), 1000, -100, 200, -100);
   
    jugador(0, 100, 200); //x, y, z
   
    scene3d.light = 0;
    scene3d.alpha = 100;
    scene3d.distance = 10;
   
    loop
        ang += 400;
       
        move_object3d(obj1, -100, 50, uz, 0, ang, 0); //id, x, y, z, angle_x, angle_y, angle_z
        move_light3d(luz2, 200, -100, 200, uz - 100); //id, intensidad, x, y, z
     
        if (key(_z)) delete_object3d(all_object3d); end
        if (key(_y)) object3d(rand(0, 4), rand(0, 1), rgb(rand(0,255), rand(0,255), rand(0,255)), rand(0, 100), 0, rand(-200, 200), rand(0, 250), rand(-200, 200)); end
        
        if (key(_esc)) exit("Amaka Soft 2015", 1); end
       
        frame;
    end
end

process jugador(x, y, z);
private
    reten = 0;
    
begin
	ctype = c_scene3d;
    scene3d.camera = id;

    loop
        if (key(_left)) xadvance(angle + 90000, -10); end
        if (key(_right)) xadvance(angle + 90000, 10); end
        if (key(_up)) advance(10); end
        if (key(_down)) advance(-10); end
        
        //angle y angle_z funcionan igual
        angle_z += (mouse.x - 320) * 10;
        angle_y -= (mouse.y - 200) * 10;

        if (angle_y > 20000) angle_y = 20000; end
        if (angle_y < -20000) angle_y = -20000; end
        
        if (mouse.left and reten == 0) disparo(x, y-20, z, angle_z); reten = 10; end

        reten--; if (reten < 0) reten = 0; end
        
        frame;
    end
end

process disparo(x, y, z, angle);    
begin
    graph = 2;
    size  = 20;
    ctype = c_scene3d;
    
    loop
        advance(25);
        
        flags++; if (flags > 3) flags = 0; end
        alpha--; if (alpha < 0) break; end
        
        frame;
    end
end
