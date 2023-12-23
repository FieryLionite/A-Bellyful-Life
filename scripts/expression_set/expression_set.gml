/// @description expression_set(expression, duration)
/// @param expression
/// @param  duration
function expression_set(argument0, argument1) {

	var patient = global.patient;
	patient.expression = argument0;
	patient.alarm[0] = argument1;



}
