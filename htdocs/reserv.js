
var select_seat_init = function() {
	
	selected_seats = [];
	for(var idx = 0; idx < 12; ++idx){
		for(var jdx = 0; jdx < 13; ++jdx)
		{
			selected_seats.push(0);
			document.getElementById(idx + "," + jdx).onclick = select_seat;
		}
	}
}

var select_seat = function() {
	var coord = this.id.split(',');
	var sequence = (parseInt(coord[0]) * 13) + parseInt(coord[1]);
	//console.log(sequence);
	
	if(selected_seats[sequence]) {
		selected_seats[sequence] = 0;
		this.setAttribute("style", "background-color: rgba(0, 0, 0, 0);");
	}
	else {
		selected_seats[sequence] = 1;
		this.setAttribute("style", "background-color: rgba(255, 0, 0, 0.5);");
	}
	
	show_result();
}

var show_result = function() {
	var cnt = 0;
	var str = "";
	
	for(var idx = 0; idx < 12; ++idx){
		for(var jdx = 0; jdx < 13; ++jdx)
		{
			if(selected_seats[sequence]){
				cnt += 1;
				str += String.fromCharCode(65 + n);
			}
		}
	}
}