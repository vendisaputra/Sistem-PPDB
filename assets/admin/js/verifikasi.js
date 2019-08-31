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
          { "data": "nama" },
          { "data": "nik" },
          { "data": "no_telepon" },
          { "data": "tgl_daftar" },
          { "data": "status" },
          { "data": "pass" },
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
function aktivasi(id_emu){
    $.ajax({
      type: "POST",
      data: {id:id_emu},
      dataType:"json",
      url: "aktivasi",
        success: function(data) {
           sweet('Verifikasi berhasil dilakukan');
           reload_table();
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
          swal("Error verifikasi!", "Please try again", "error");
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
          $('[name="ndepan"]').val(data.nama_depan);
          $('[name="nbelakang"]').val(data.nama_belakang);
          $('[name="nik"]').val(data.nik);
          $('[name="notelp"]').val(data.no_telepon);
          $('[name="email"]').val(data.email);
          $('[name="id_daftar"]').val(data.id_daftar);
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
        swal("Error showing!", "Please try again", "error");
      }
  });
}

function reset_Data(){
 // ajax delete data to database
  swal({
      title: 'Apakah Anda Yakin?',
      text: "Akan Mereset Semua Data Pendaftaran!",
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: "Ya!!",
      closeOnConfirm: true
    },
    function (isConfirm) {
      if (isConfirm) {
        $.ajax({
          url: "reset_ulang",
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

