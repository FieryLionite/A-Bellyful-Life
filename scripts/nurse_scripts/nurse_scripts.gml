function nurse_dialogue(){
dialogue_init();
	
	dialogue_create(
		        "1",
		        "Pay medical bills: " + string(Nurse.bills) + "$",
		        true,
		       nurse_pay_bills
		)

	dialogue_start(true);
}

function nurse_pay_bills(){
	ControlEnv.money -= Nurse.bills;
	Nurse.bills = 0;
}

function nurse_location(){
	return rmClinic;	
}