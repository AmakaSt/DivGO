// Pruebas de compilador online Div Games
// Php + Html5 + Canvas + Javascript
// by J. Manuel Habas

program ejemplo_joy_pad;
global
	joystick = 0;
    
begin
	/* pruebas con opciones de pantalla */
	set_mode(480, 200);
	screen_color(#333);

	set_fps(60, 0);
    
	text_size = 80;
	text_color = #fff;
    
	write(0, 240, 20, 4, "Pulsa cualquier boton del Control Pad");
	write(0, 240, 45, 5, "Detectado: ");
    write_int(0, 240, 45, 3, offset joystick);

    write_int(0, 0, 120, 3, offset pad.stick1.up);
    write_int(0, 100, 120, 3, offset pad.stick1.down);
    write_int(0, 200, 120, 3, offset pad.stick1.left);
    write_int(0, 300, 120, 3, offset pad.stick1.right); 

    write_int(0, 0, 140, 3, offset pad.stick2.up);
    write_int(0, 100, 140, 3, offset pad.stick2.down);
    write_int(0, 200, 140, 3, offset pad.stick2.left);
    write_int(0, 300, 140, 3, offset pad.stick2.right);

	//gatillos
    write_int(0, 100, 100, 3, offset pad.button8);
    write_int(0, 200, 100, 3, offset pad.button9);

    write_int(0, 0, 160, 3, offset pad.up);		//joy.up
    write_int(0, 20, 160, 3, offset pad.down);	//joy.down
    write_int(0, 40, 160, 3, offset pad.left);	//joy.left
    write_int(0, 60, 160, 3, offset pad.right); //joy.right
    
    write_int(0, 0, 180, 3, offset pad.button0); 	//joy.button1
    write_int(0, 20, 180, 3, offset pad.button1);	//joy.button2
    write_int(0, 40, 180, 3, offset pad.button2);	//joy.button3
    write_int(0, 60, 180, 3, offset pad.button3);	//joy.button4
    write_int(0, 80, 180, 3, offset pad.button4);
    write_int(0, 100, 180, 3, offset pad.button5);
    write_int(0, 120, 180, 3, offset pad.button6);
    write_int(0, 140, 180, 3, offset pad.button7);
    
    //button stick
	write_int(0, 160, 180, 3, offset pad.stick1.button);
    write_int(0, 180, 180, 3, offset pad.stick2.button);
    
	loop
		joystick = get_browser(b_pad_connect);
        
		frame;
	end
end