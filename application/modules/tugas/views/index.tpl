
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{$title|default:'Admin | SD MUHAMMADIYAH 16 SURAKARTA'}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="{base_url()}assets/daftar/css/bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{base_url()}assets/daftar/css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="{base_url()}assets/daftar/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="{base_url()}assets/daftar/css/skins/_all-skins.css">
    <link rel="stylesheet" href="{base_url()}plugins/datetimepicker/css/bootstrap-datepicker.css">
    <!-- data tables-->
    <link href="{base_url()}plugins/media/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <!-- Sweet Alert -->
    <link href="{base_url()}plugins/sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap file input -->
    <link href="{base_url()}plugins/fileinput/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     <link rel="icon" type="image/png" href="{base_url()}assets/user/img/logo.ico">
  </head>
  <body class="hold-transition skin-black sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">

      <header class="main-header">
        <!-- Logo -->
        <a href="{base_url()}_lod/daction/" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>AD</b>MIN</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Guru | T</b>ugas</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="{base_url()}assets/daftar/img/log.png" class="user-image" alt="User Image">
                  <span class="hidden-xs">{$username}</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="{base_url()}assets/daftar/img/log.png" class="img-circle" alt="User Image">
                    <p>
                      
                      <small></small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="{base_url()}tugas/set/" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="{base_url()}tugas/aut_login/logout" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              
            </ul>
          </div>
        </nav>
      </header>

      <!-- =============================================== -->

      <!-- Left side column. contains the sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            
          </div>
          
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview">
              <a href="{base_url()}tugas/tugas/">
                <i class="fa fa-home"></i> <span>HOME</span> 
              </a>
            </li>
            <li class="treeview">
              <a href="{base_url()}tugas/tugas/daftarTugas">
                <i class="fa fa-info"></i> <span>Daftar tugas</span> 
              </a>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- =============================================== -->
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        {block name=content}
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <div class="callout callout-info">
            <h4>SELAMAT DATANG DI Bapak/Ibu </h4>
            <p>Silahkan pilih menu bagian kiri untuk memberikan tugas</p>
          </div>
        </section>
        <!-- Main content -->
        <section class="content">
          
        </section><!-- /.content -->
        {/block}
      </div><!-- /.content-wrapper -->

      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          
        </div>
       <strong>Copyright &copy; 2017. </strong>
      </footer>

      
    <!-- jQuery 2.1.4 -->
    <script src="{base_url()}assets/daftar/js/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="{base_url()}assets/daftar/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="{base_url()}assets/daftar/js/app.min.js"></script>
    <!-- Sweet Alert -->
    <script src="{base_url()}plugins/sweetalert/sweetalert.min.js" type="text/javascript"></script>
    <script src="{base_url()}plugins/sweetalert/swalert.js" type="text/javascript"></script>
    <!-- Tiny Mce / untuk membuat tampilan type text menjadi tampilan blogspot -->
    <script src="{base_url()}plugins/tinymce/tinymce.min.js"></script>
    <script>
        tinymce.init({
            selector: "#textarea",theme: "modern",height: 220,
            plugins: [
                 "advlist autolink link image lists charmap print preview hr anchor pagebreak",
                 "searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
                 "table contextmenu directionality emoticons paste textcolor"
           ],
           toolbar1: "undo redo | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | styleselect",
           toolbar2: "| responsivefilemanager | link unlink anchor | image media | forecolor backcolor  | print preview code ",
           image_advtab: true ,
           external_filemanager_path:"{base_url()}plugins/filemanager/",
           filemanager_title:"Responsive Filemanager" ,
           external_plugins: { "filemanager" : "../filemanager/plugin.min.js"}
        });
    </script>
    {block name=footer}
    <!-- Datetimepicker -->
    <script src="{base_url()}plugins/datetimepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        //function get_tanggal(){
            $(function () {
                $('#datepicker').datepicker({
                  startView: 2,
                  language: "id",
                  orientation: "bottom auto",
                  autoclose: true,
                  format: 'yyyy-mm-dd',
                });
            });    
        //}      
    </script>
    <!-- Sidebar menu -->
    <script type="text/javascript">
        /** add active class and stay opened when selected */
        var url = window.location;
        // for sidebar menu entirely but not cover treeview
        $('ul.sidebar-menu a').filter(function() {
             return this.href == url;
        }).parent().addClass('active');
        // for treeview
        $('ul.treeview-menu a').filter(function() {
             return this.href == url;
        }).parentsUntil(".sidebar-menu > .treeview-menu").addClass('active');
    </script>
    {/block}
  </body>
</html>
