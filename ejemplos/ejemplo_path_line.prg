PROGRAM ejemplo_path_line;
BEGIN
	set_mode(320, 200, 1);
    put_screen(0, 150);
    graph=1;
    size =50;
    raton();
    LOOP
		delete_draw(all_drawing);
        // Mira si puede ir en línea recta hacia el ratón
        IF (path_line(0,150,1,mouse.x,mouse.y))

            IF (fget_dist(x,y,mouse.x,mouse.y)>4)
                xadvance(fget_angle(x,y,mouse.x,mouse.y),4);
                draw(1,#fff,15,0,x,y,mouse.x,mouse.y);
            ELSE
                x=mouse.x;
                y=mouse.y;
            END
        END

        FRAME;
    END
END

process raton();
begin
	graph = 2;
    size  = 20;

	loop
		x = mouse.x;
		y = mouse.y;
	
		frame;
	end
end