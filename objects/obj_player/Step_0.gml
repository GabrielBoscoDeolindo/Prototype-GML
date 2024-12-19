// Evento Step

// Zerar velocidades
hsp = 0;
vsp = 0;

// Entrada de teclado
if (keyboard_check(ord("W"))) vsp = -spd;
if (keyboard_check(ord("S"))) vsp = spd;
if (keyboard_check(ord("A"))) hsp = -spd;
if (keyboard_check(ord("D"))) hsp = spd;

// Movimentação diagonal (normalização)
if (hsp != 0 && vsp != 0) {
    var diag_factor = sqrt(0.5);
    hsp *= diag_factor;
    vsp *= diag_factor;
}

// Atualizar posição
x += hsp;
y += vsp;

// Alterar sprite com base no movimento
if (hsp == 0 && vsp == 0) {
    // Jogador parado (Idle) com base na direção que ele estava olhando

    // Se o movimento foi para baixo e para a esquerda
    if (last_hsp < 0 && last_vsp > 0) sprite_index = spr_player_idle_left;  
    // Se o movimento foi para baixo e para a direita
    else if (last_hsp > 0 && last_vsp > 0) sprite_index = spr_player_idle_right;  
    // Se o movimento foi apenas para baixo
    else if (last_vsp > 0) sprite_index = spr_player_idle_down;  
    // Se o movimento foi para cima e para a esquerda
    else if (last_hsp < 0 && last_vsp < 0) sprite_index = spr_player_idle_up_left;  
    // Se o movimento foi para cima e para a direita
    else if (last_hsp > 0 && last_vsp < 0) sprite_index = spr_player_idle_up_right;  
    // Se o movimento foi apenas para cima
    else if (last_vsp < 0) sprite_index = spr_player_idle_up;  
    // Se o movimento foi apenas para a esquerda
    else if (last_hsp < 0) sprite_index = spr_player_idle_left;  
    // Se o movimento foi apenas para a direita
    else if (last_hsp > 0) sprite_index = spr_player_idle_right;  
} else {
    // Jogador em movimento
    if (hsp < 0 && vsp < 0) sprite_index = spr_player_walk_up_left;       // Diagonal cima-esquerda
    else if (hsp > 0 && vsp < 0) sprite_index = spr_player_walk_up_right; // Diagonal cima-direita
    else if (vsp > 0 && hsp < 0) sprite_index = spr_player_walk_left;     // Diagonal baixo-esquerda
    else if (vsp > 0 && hsp > 0) sprite_index = spr_player_walk_right;    // Diagonal baixo-direita
    else if (vsp > 0) sprite_index = spr_player_walk_down;                // Apenas para baixo
    else if (vsp < 0) sprite_index = spr_player_walk_up;                  // Apenas para cima
    else if (hsp < 0) sprite_index = spr_player_walk_left;                // Apenas para a esquerda
    else if (hsp > 0) sprite_index = spr_player_walk_right;               // Apenas para a direita
} 

// Salvar a direção anterior para utilizar no "idle"
last_hsp = hsp;
last_vsp = vsp;

