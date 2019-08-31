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
          { "data": "1" },
          { "data": "2" },
          { "data": "3" },
          { "data": "4" },
          ]
  });
});
function reload_table(){
    menu_oTables.ajax.reload(null,false); //reload datatable ajax 
}


