/// @description  _ctb_create_word( x,y,color,font,text );
/// @param  x
/// @param y
/// @param color
/// @param font
/// @param text 
function _ctb_create_word() {
	/*
	    This represents a word object.
	    You should normally never have the need
	    to call this script.
	*/

	var w=0;
	w[0] = "word";
	w[1] = argument[0];
	w[2] = argument[1];
	w[3] = argument[2];
	w[4] = argument[3];
	w[5] = argument[4];

	return w;



}
