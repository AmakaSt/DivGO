// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

PROGRAM ejemplo_screen_copy;

GLOBAL
    ángulo;
    ángulo2;

BEGIN
    //load_fpg("help\help.fpg");
    set_mode(m320x240);
	graph=2;
    x=160;
    y=100;
    put(0,graph,x,y);
    LOOP

        // Copia la pantalla (región 0) al gráfico 2

        screen_copy(0,0,2,0,0,320,200);

        ángulo+=1000;
        ángulo2+=1971;
        angle=get_distx(ángulo,25000);
        size=95+get_disty(ángulo2,30);
        FRAME;
    END
END