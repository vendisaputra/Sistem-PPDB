var menu_oTables="";
$(document).ready(function(){
  menu_oTables = $('#extmdm').DataTable({
          "bPaginate": true,
          "bLengthChange": true,
          "bFilter": true,
          "bSort": true,
          "bInfo": true,
          "bAutoWidth": true,

       "ajax": {
          "url": "tampil_daftar",
          "type": "POST",
          "dataType" : "json",
       },
       "columns": [
          { "data": "no" },
          { "data": "0" },
          { "data": "1" },
          { "data": "action" },
          ]
  });
});
function reload_table(){
    menu_oTables.ajax.reload(null,false); //reload datatable ajax 
}
function show_modal (x) {
  $.ajax({
    type: "POST",
    data: {id:x},
    dataType:"JSON",
    url: "show_modal",
      success: function(data) {
          $('[name="content"]').val(data.contentt);
          $('[name="id_sumbangan"]').val(data.id_setting);
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
        swal("Error showing!", "Please try again", "error");
      }
  });
}


