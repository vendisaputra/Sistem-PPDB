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
          "url": "tampil_seragam",
          "type": "POST",
          "dataType" : "json",
       },
       "columns": [
          { "data": "no" },
          { "data": "nama" },
          { "data": "1" },
          { "data": "terbilang" },
          ]
  });
});
function reload_table(){
    menu_oTables.ajax.reload(null,false); //reload datatable ajax 
}


