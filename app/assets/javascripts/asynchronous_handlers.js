

var counter = document.getElementsByClassName("classname").length

function addCustomAttributeToPage(){

    ++counter;
    
    var html_content = '<div class="custom-attribute"><div class="control-group"><label class="control-label" for="room_custom_attributes_attributes_' + counter + '_id">Id</label><div class="controls"><input class="text_field" id="room_custom_attributes_attributes_' + counter + '_id" name="room[custom_attributes_attributes][' + counter + '][id]" type="text"></div></div><div class="control-group"><label class="control-label" for="room_custom_attributes_attributes_' + counter + '_room_id">Room</label><div class="controls"><input class="text_field" id="room_custom_attributes_attributes_' + counter + '_room_id" name="room[custom_attributes_attributes][' + counter + '][room_id]" type="text"></div></div><div class="control-group"><label class="control-label" for="room_custom_attributes_attributes_' + counter + '_name">Name</label><div class="controls"><input class="text_field" id="room_custom_attributes_attributes_' + counter + '_name" name="room[custom_attributes_attributes][' + counter + '][name]" type="text"></div></div><div class="control-group"><label class="control-label" for="room_custom_attributes_attributes_' + counter + '_value">Value</label><div class="controls"><input class="text_field" id="room_custom_attributes_attributes_' + counter + '_value" name="room[custom_attributes_attributes][' + counter + '][value]" type="text"></div></div><a class="delete_custom_attribute btn btn-danger" data-method="delete" data-remote="true" href="javascript:;" onclick="$(this).closest(' + "'.custom-attribute'" + ').remove()" rel="nofollow">Delete attribute</a></div>';


      $('#custom_attributes_section').append(html_content)

}


function searchForOrganizationByName(){
	var search_results_div = $("#search_results")
	var search_string = document.getElementById('org_search_box').value;
	var jqxhr = $.get("/organizations/search_by_name", {name: search_string}, function(data) {
	  search_results_div.empty();
	  search_results_div.append(data);
	})
	.fail(function() { alert("Could not return search results"); })
}

function searchForUserByEmail(){
	var search_results_div = $("#search_results")
	var search_string = document.getElementById('email_search_box').value;
	var jqxhr = $.get("/users/search_by_email", {email: search_string}, function(data) {
	  search_results_div.empty();
	  search_results_div.append(data);
	})
	.fail(function() { alert("Could not return search results"); })
}

function page_ready(){
	
	$('#search_results').on('click', 'tr.organization_results_row', function(e){
		$('#membership_organization_id').val(this.id)
		$('#membership_organization_name').text($(this).first().text())
		$('tr.organization_results_row').removeClass("success")
		$(this).addClass("success")
	});

	$('#search_results').on('click', 'tr.user_results_row', function(e){
		$('#membership_user_id').val(this.id)
		$('#membership_user_name').text($(this).first().text())
		$('tr.user_results_row').removeClass("success")
		$(this).addClass("success")
	});

};

$(document).ready(page_ready)
$(document).on('page:load', page_ready)