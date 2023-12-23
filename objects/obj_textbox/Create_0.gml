/*
    Read the scripts, they contain all the required information about
    all the below functions.
*/
//html5 compatibility
depth = -10000;
alarm[0] = 1;
destroyed = false; //WTF
current_text = "";

// Initialize the CTB engine
ctb_init();

// Mark this object as being a textbox
ctb_create();

// Add some icons
icon_typing = spr_ico_typing_small;
icon_finished = spr_ico_continue_small;

// Add some colors
//ctb_add_color( "default", c_white );
ctb_add_color( "default", c_black );
ctb_add_color( "white", c_white );
ctb_add_color( "blue", c_blue );
ctb_add_color( "yellow", c_yellow );
ctb_add_color( "red", c_red );

// Add some fonts

if (global.language == EN || global.language == RUS){
	ctb_add_font( "default", fnt_popup );
	ctb_add_font( "normal", fnt_popup );
	ctb_add_font( "small", f_other );
	ctb_add_font( "tiny", fntTiny );
	ctb_add_font( "large", fntLarge );
	ctb_add_font( "huge", fntHuge );
}else{
	ctb_add_font( "default", fntTiny );
	ctb_add_font( "normal", fntTiny );
	ctb_add_font( "small", fntTiny );
	ctb_add_font( "tiny", fntTiny );
	ctb_add_font( "large", fntTiny );
	ctb_add_font( "huge", fntTiny );
}

// Add a sound
//ctb_add_sound( "gun", snd_gun );

// Add a custom command to change character image!
char_sprite = spr_char;
ctb_add_command( "bg_intro", command_intro )
ctb_add_command( "face", command_faces )
ctb_add_command( "bg", command_bg )

// Set the padding of the textbox
// We add a big left padding to insert a character sprite in rhw textbox

////ctb_set_padding( 116,10,10,10 );

// Set the textbox's background//////////////////////
//sprite_index = ctb_load_subimage( spr_textbox_slice9_subimages, room_width-128, 108 );
sprite_index = ctb_load_subimage( sprBlank, room_width-128, 108 );

finish_script = noone;
finish_room = noone;
// Add some text in the textbox.
/*
ctb_add_text( "W[c:blue]e[c:yellow]l[c:red]c[c:default]o[c:blue]m[c:red]e[c:yellow]![c:default]" );
ctb_add_text( "My name is Alicard.#[pause:15]I will explain you what this textbox engine can do." );
ctb_add_text( "First, you should know that it works using [f:other][c:yellow][tags][f:default][c:default]." );
ctb_add_text( "Those [c:yellow]tags[c:default] will let you control some cool properties of your textbox." );
ctb_add_text( 
    "Some of them are [f:other]Fonts[f:default],[pause:30]"+
    " [c:blue]Colors[c:default],[pause:30] [speed:0.1]Speed[speed:1],[pause:30]"+
    " Sounds[sound:gun],[pause:30] pauses,[pause:30] or even custom commands that you can add!"
);
ctb_add_text( "Exciting, isn't it?" );
ctb_add_text( "All of them are available through the use of tags." );
ctb_add_text( "For example, to use a [c:blue]Color[c:default], you would use the [tag:off][c:<color_name>] or [color:<color_name>][tag:on] tags." );
ctb_add_text( "You can even use your own scripts in your own tags!" );
ctb_add_text( "For example, let's change my face for a second..." );
ctb_add_text( "[char:char2]Woah![pause:8]Woah![pause:8]Woah![pause:15]#What is going on!!!" );
ctb_add_text( "[char:char]Gosh, thank god it was only for one moment!" );
ctb_add_text( "Other cool features of the textbox are [c:yellow]Auto-Wrapping[c:default] and [c:blue]Auto-Overflow[c:default]." );
ctb_add_text( "[c:yellow]Auto-Wrapping[c:default] will automatically ajust the text to fit in the textbox." );
ctb_add_text( "You don't have to add any newline character." );
ctb_add_text( "Be warned that the textbox uses tags for newline, but also the [c:yellow][#][c:default] character." );
ctb_add_text( "To use the [#] character, you must use the [tag:off][#][tag:on] tag." );
ctb_add_text( "[c:blue]Auto-Overflow[c:default] means that if you add too much text, the overflowing text will automatically be added into the next page of the dialogue for you." );
ctb_add_text( "With those two automatic features, you don't have to worry about your text fitting in the textbox, the textbox takes care of all that for you." );
ctb_add_text( "With all that said,[pause:15]#I hope this little textbox will fit your games!" );
ctb_add_text( "Now I must take my leave." );
ctb_add_text( "Thanks for trying my textbox!" );
*/

/* */
/*  */
