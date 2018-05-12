$(function(){

	// add multiple select / deselect functionality
	$("#selectall").click(function () {
		  $('.deleteAc').attr('checked', this.checked);
	});

	// if all checkbox are selected, check the selectall checkbox
	// and viceversa
	$(".deleteAc").click(function(){

		if($(".deleteAc").length == $(".deleteAc:checked").length) {
			$("#selectall").attr("checked", "checked");
		} else {
			$("#selectall").removeAttr("checked");
		}

	});
});

//DeleteStudent
$(function(){

	// add multiple select / deselect functionality
	$("#selectallStudent").click(function () {
		  $('.deleteStt').attr('checked', this.checked);
	});

	// if all checkbox are selected, check the selectall checkbox
	// and viceversa
	$(".deleteStt").click(function(){

		if($(".deleteStt").length == $(".deleteStt:checked").length) {
			$("#selectallStudent").attr("checked", "checked");
		} else {
			$("#selectallStudent").removeAttr("checked");
		}

	});
});

//Delete Course
$(function(){

	// add multiple select / deselect functionality
	$("#selectallC").click(function () {
		  $('.deleteC').attr('checked', this.checked);
	});

	// if all checkbox are selected, check the selectall checkbox
	// and viceversa
	$(".deleteC").click(function(){

		if($(".deleteC").length == $(".deleteC:checked").length) {
			$("#selectallC").attr("checked", "checked");
		} else {
			$("#selectallC").removeAttr("checked");
		}

	});
});