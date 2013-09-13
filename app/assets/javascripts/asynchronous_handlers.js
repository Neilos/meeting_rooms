
var counter = document.getElementsByClassName("classname").length

function addCustomAttributeToPage(){

    ++counter;
    
    var html_content = '<div class="custom-attribute"><div class="control-group"><label class="control-label" for="room_custom_attributes_attributes_' + counter + '_id">Id</label><div class="controls"><input class="text_field" id="room_custom_attributes_attributes_' + counter + '_id" name="room[custom_attributes_attributes][' + counter + '][id]" type="text"></div></div><div class="control-group"><label class="control-label" for="room_custom_attributes_attributes_' + counter + '_room_id">Room</label><div class="controls"><input class="text_field" id="room_custom_attributes_attributes_' + counter + '_room_id" name="room[custom_attributes_attributes][' + counter + '][room_id]" type="text"></div></div><div class="control-group"><label class="control-label" for="room_custom_attributes_attributes_' + counter + '_name">Name</label><div class="controls"><input class="text_field" id="room_custom_attributes_attributes_' + counter + '_name" name="room[custom_attributes_attributes][' + counter + '][name]" type="text"></div></div><div class="control-group"><label class="control-label" for="room_custom_attributes_attributes_' + counter + '_value">Value</label><div class="controls"><input class="text_field" id="room_custom_attributes_attributes_' + counter + '_value" name="room[custom_attributes_attributes][' + counter + '][value]" type="text"></div></div><a class="delete_custom_attribute btn btn-danger" data-method="delete" data-remote="true" href="javascript:;" onclick="$(this).closest(' + "'.custom-attribute'" + ').remove()" rel="nofollow">Delete attribute</a></div>';


      $('#custom_attributes_section').append(html_content)

}
