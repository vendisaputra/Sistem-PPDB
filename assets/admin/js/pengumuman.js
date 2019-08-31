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
          "url": "tampil_daftar_Pengumuman",
          "type": "POST",
          "dataType" : "json",
       },
       "columns": [
          { "data": "no" },
          { "data": "judul" },
          { "data": "tanggal_terbit" },
          { "data": "isi" },
          { "data": "action" },
          ]
  });
});
function reload_table(){
    menu_oTables.ajax.reload(null,false); //reload datatable ajax 
}
function hpsdt(id_emu){
 // ajax delete data to database
  swal({
      title: 'Are you sure?',
      text: "You won't be able to delete this!",
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: "Yes, delete it!",
      closeOnConfirm: true
    },
    function (isConfirm) {
      if (isConfirm) {
        $.ajax({
          type: "POST",
          data: {id:id_emu},
          dataType:"HTML",
          url: "hapusdata",
            success: function(data) {
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
              swal("Error deleting!", "Please try again", "error");
            }
        });
      }
        
    });
}
function show_modal (x) {
  $.ajax({
    type: "POST",
    data: {id:x},
    dataType:"JSON",
    url: "show_modal",
      success: function(data) {
          $('[name="nama"]').val(data.nama);
          $('[name="username"]').val(data.username);
          $('[name="id_guru"]').val(data.id_guru);
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
        swal("Error showing!", "Please try again", "error");
      }
  });
}


