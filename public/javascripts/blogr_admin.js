function focusEmailField(el) {
	if(el.value == "E-mail") {
		el.value = "";
		el.style.color = "#000";
	}
}

function blurEmailField(el) {
	if(el.value == "") {
		el.value = "E-mail";
		el.style.color = "#777";
	}
}

function focusPasswordField(el) {
	if(el.value == "Password") {
		el.value = "";
		el.style.color = "#000";
	}
}

function blurPasswordField(el) {
	if(el.value == "") {
		el.value = "Password";
		el.style.color = "#777";
	}
}