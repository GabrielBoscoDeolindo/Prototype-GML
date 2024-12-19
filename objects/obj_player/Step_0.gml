// Zerar velocidades
hsp = 0;
vsp = 0;


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


x += hsp;
y += vsp;

// Alterar sprite com base no movimento
if (hsp == 0 && vsp == 0) {
    switch(sprite_index) {
        case spr_player_walk_up_left:
            sprite_index = spr_player_idle_up_left; 
            break;
        case spr_player_walk_up_right:
            sprite_index = spr_player_idle_up_right; 
            break;
        case spr_player_walk_left:
            sprite_index = spr_player_idle_left;     
            break;
        case spr_player_walk_right:
            sprite_index = spr_player_idle_right; 
            break;
        case spr_player_walk_down:
            sprite_index = spr_player_idle_down;      
            break;
        case spr_player_walk_up:
            sprite_index = spr_player_idle_up;          
            break;
    }
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
