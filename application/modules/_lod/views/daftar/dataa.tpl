
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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="hold-transition skin-green sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">

      <header class="main-header">
        <!-- Logo -->
        <a href="{base_url()}_lod/daction/" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>SD</b>MU</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>SD M</b>16 Surakarta</span>
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
                      <a href="index.php?page=edd_acount&id_admin=aa" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="{base_url()}_lod/auth_login/logout" class="btn btn-default btn-flat">Sign out</a>
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
              <a href="{base_url()}_lod/daction/">
                <i class="fa fa-home"></i> <span>HOME</span> 
              </a>
            </li>
            {if $dfinalisasi == TRUE}
              {if $dstatus == TRUE}
                <li class="treeview">
                  <a href="#">
                    <i class="fa fa-edit"></i>
                    <span>Edit</span>
                    <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu">
                    <li><a href="{base_url()}_lod/edata/"><i class="fa fa-circle-o"></i> Data Ayah</a></li>
                    <li><a href="{base_url()}_lod/edata/post_ib"><i class="fa fa-circle-o"></i> Data Ibu</a></li>
                    <li><a href="{base_url()}_lod/edata/post_wali"><i class="fa fa-circle-o"></i> Data Wali</a></li>
                    <li><a href="{base_url()}_lod/edata/post_cs"><i class="fa fa-circle-o"></i> Data Calon Siswa</a></li>
                    <li><a href="{base_url()}_lod/edata/biaya_post"><i class="fa fa-circle-o"></i> Data Biaya</a></li>
                  </ul>
                </li>
              {/if}
            {/if}
            
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- =============================================== -->
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        {block name=content}
        <!-- Content Header (Page header) -->
        {if isset($message)}
          <section class="content-header">
            <div class="callout callout-info">
              <h4>INFO!</h4>
              <p>{$message}</p>
            </div>
          </section>
        {else}
          <section class="content-header">
            <div class="callout callout-warning">
              <h4>INFO!</h4>
              <p>Pastikan data yang anda masukkan sudah benar</p>
            </div>
          </section>
        {/if}
        <!-- Main content -->
        <section class="content">
          <!-- quick email widget -->
          <div class="box box-danger">
            <div class="box-header">
              <i class="fa fa-envelope"></i>
              <h3 class="box-title">Identitas Orangtua: Ayah Kandung:</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
              </div><!-- /. tools -->
            </div>
            <div class="box-body">
              <form action="{base_url()}_lod/daction/" method="post">
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Nama Depan</label>
                      <input type="text" minlength="3" class="form-control" name="ndepan" placeholder="Nama depan:" value="{set_value('ndepan')}" required/>
                      {form_error('ndepan')}
                    </div>
                    
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Nama Tengah</label>
                      <input type="text" class="form-control" name="ntengah" placeholder="Nama tengah:" value="{set_value('ntengah')}">
                      {form_error('ntengah')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Nama Belakang</label>
                      <input type="text" class="form-control" name="nbelakang" placeholder="Nama belakang:" value="{set_value('nbelakang')}">
                      {form_error('nbelakang')}
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">NIK</label>
                      <input type="number" min="10" class="form-control" name="nik" placeholder="NIK:" value="{set_value('nik')}" required/>
                      {form_error('nik')}
                    </div>
                     <div class="col-md-2">
                      <label for="exampleInputEmail1">No Hp</label>
                      <input type="number" min="10" class="form-control" name="no_hp" placeholder="No Hp" value="{set_value('no_hp')}" required/>
                      {form_error('no_hp')}
                    </div>
                    <div class="col-md-2">
                      <label for="exampleInputEmail1">No Telp</label>
                      <input type="number" min="8" class="form-control" name="no_telp" placeholder="No Telpon" value="{set_value('no_telp')}" required/>
                      {form_error('no_telp')}
                    </div>
                    <div class="col-md-2">
                      <label for="exampleInputEmail1">Tempat Lahir</label>
                      <input type="text" class="form-control" name="tmp_lahir" placeholder="Tempat" minlength="3" value="{set_value('tmp_lahir')}" required/>
                      {form_error('tmp_lahir')}
                    </div>
                    
                    <div class="col-md-2">
                      <label for="exampleInputEmail1">Tanggal Lahir</label>
                      <input type="text" class="form-control" name="tgl_lahir" id="datepicker" placeholder="Tanggal lahir:" value="{set_value('tgl_lahir')}" required/>
                      {form_error('tgl_lahir')}
                    </div>
                    
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-2">
                      <label for="exampleInputEmail1">RT</label>
                      <input type="number" min="1" class="form-control" name="rt" placeholder="RT:"  value="{set_value('rt')}" required/>
                      {form_error('rt')}
                    </div>
                    <div class="col-md-2">
                      <label for="exampleInputEmail1">RW</label>
                      <input type="number" class="form-control" name="rw" placeholder="RW:"  value="{set_value('rw')}" required/>
                      {form_error('rw')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Dusun</label>
                      <input type="text" class="form-control" name="dusun" placeholder="Dusun/Dukuh:" minlength="3"  value="{set_value('dusun')}" required/>
                      {form_error('dusun')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Desa</label>
                      <input type="text" class="form-control" name="desa" placeholder="Desa/Kelurahan:" minlength="3"  value="{set_value('desa')}" required/>
                      {form_error('desa')}
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Kecamatan</label>
                      <input type="text" class="form-control" name="kac" placeholder="Kecamatan" minlength="3"  value="{set_value('kac')}" required/>
                      {form_error('kac')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Kabupaten/Kota</label>
                      <input type="text" class="form-control" name="kab" placeholder="Kabupaten/Kota:" minlength="3"  value="{set_value('kab')}" required/>
                      {form_error('kab')}
                    </div>
                     <div class="col-md-2">
                      <label for="exampleInputEmail1">Pendidikan</label>
                      <input type="text" class="form-control" name="pendidikan" placeholder="Pendidikan:"  value="{set_value('pendidikan')}" required/>
                      {form_error('pendidikan')}
                    </div>
                    <div class="col-md-2">
                      <label for="exampleInputEmail1">Pekerjaan</label>
                      <input type="text" class="form-control" name="pekerjaan" placeholder="Pekerjaan:" minlength="3"  value="{set_value('pekerjaan')}" required/>
                      {form_error('pekerjaan')}
                    </div>
                  </div>
                </div>
              
            </div>
            <div class="box-footer clearfix">
              <button type="submit" class="pull-right btn btn-info" id="sendEmail">Simpan <i class="fa fa-arrow-circle-right"></i></button>
            </div>
            </form>
          </div>
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
    {/block}
  </body>
</html>
