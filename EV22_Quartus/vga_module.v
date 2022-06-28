module vga_module(         
	// Inputs
	pixel_rgb,					// RGB del píxel a escribir (lo lee de la memoria RAM con la imagen)
	reset,						// Reset - Active low
	clock,						// VGA clock
	// Outputs
	vga_hsync,					// VGA hsync 
	vga_vsync,					// VGA vsync
	vga_rgb,						// VGA RGB (datos del pixel a escribir en pantalla)
	pixel_address				// Dirección del píxel a escribir en la memoria (left to right, top to bottom)
);
	
	/* Parámetros*/
	
	parameter hactive = 640;
	parameter hactive_sh = 160;	// 640/4
	parameter hfrontporch = 16;
	parameter hsyncpulse = 96;
	parameter hbackporch = 48;
	parameter htotal = 800;
	
	parameter vactive = 480;
	parameter vfrontporch = 10;
	parameter vsyncpulse = 2;
	parameter vbackporch = 33;
	parameter vtotal = 525;

	/* Outputs */
	
	output reg [2:0] vga_rgb;
	output reg vga_hsync = 1'b1;
	output reg vga_vsync = 1'b1;
	output reg [14:0] pixel_address;
	
	wire [9:0] pixel_row;
	wire [9:0] pixel_col;
	
	/* Inputs */
	
	input wire [2:0] pixel_rgb;
	input wire reset;
	input wire clock;
	
	/* Contadores */
	
	reg [9:0] h_count = 0;	// Contador de píxeles horizontales
	reg [9:0] v_count = 0; 	// Contador de líneas verticales
	
	reg [9:0] next_h_count = 0; 
	reg [9:0] next_v_count = 0; 	
	
	reg active;				// Igual a 1 cuando se está en la zona activa (i.e. dentro de la pantalla)
	
	
	
	
	/* Actualización de contradores */
	
	always @(posedge clock) begin: COUNTER_LOGIC
		if (reset) begin
			h_count = next_h_count;
			v_count = next_v_count;
			if (next_h_count == (htotal - 1)) begin //Si se completó una línea, resetea el contador de píxeles horizontales (y si no se completó, no actualizo v_count)
				next_h_count <= 0;
				if (next_v_count == (vtotal - 1)) begin //Si se completó la pantalla, resetea el contador de líneas
					next_v_count <= 0;
				end else begin
					next_v_count <= next_v_count + 1;
				end
			end else begin
				next_h_count <= next_h_count + 1;
			end
		end else begin
			next_h_count <= 0; //Si reset está activado, reinicio la pantalla
			next_v_count <= 0;
		end	
	end		
			
	
	/* Control de señales hsync y vsync */
	
	always @* begin
		// Busco si estoy en la zona activa de la pantalla para saber si mandar o no píxeles
		if (h_count >= 0 && h_count < hactive && v_count >= 0 && v_count < vactive)
			active = 1'b1;
		else
			active = 1'b0;
		
		// Busco si estoy en la zona de sync para saber si mandar o no las señales de sync (activo bajas)
		if (h_count >= (hfrontporch + hactive) && h_count < (hfrontporch + hactive + hsyncpulse))
			vga_hsync = 1'b0;
		else 
			vga_hsync = 1'b1;
			
		if (v_count >= (vfrontporch + vactive) && v_count < (vfrontporch + vactive + vsyncpulse))
			vga_vsync = 1'b0;
		else
			vga_vsync = 1'b1;
	end
	

	/* Escritura del píxel */

	assign pixel_row = v_count;
	assign pixel_col = h_count;
	
	always @* begin
	
		if (active) begin
			pixel_address <= (next_v_count>>2) * hactive_sh + (next_h_count>>2); //Busco la dirección del siguiente píxel a escribir en pantalla
			vga_rgb = pixel_rgb; //Mando el píxel actual a pantalla
		end else begin
			pixel_address = 0; //Si no estoy en la zona activa, no busco el siguiente píxel (no tendría sentido) y mando color negro
			vga_rgb = 3'b000;
		end
	end
endmodule