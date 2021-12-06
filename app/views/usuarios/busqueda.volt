<div id='contenido' class='row mt-5'>
    <div class='col-sm-12'>
        <div class='row'>
            <div class='col-6'>
                <button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#editarModal'>Agregar Usuario</button>
                <a href='/' class='btn btn-danger btn-small'>Regresar</a>
            </div>
            <div class='col-6'>
                <form action="{{url("usuarios/busqueda")}}" class="row" method="POST">
                    <div class="col-8">
                        <input type="text" name="nombre" class="form-control input-sm" placeholder="Búsqueda...">
                    </div>
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary btn-sm">Buscar</button>
                    </div>
                </form>
            </div>
        </div>

        <table class='table table-hover'>
            <thead>
                <tr>
                    <th scope='col'>Nombre</th>
                    <th scope='col'>Usuario</th>
                    <th scope='col'>Correo</th>
                    <th scope='col'></th>
                </tr>
            </thead>
            <tbody>
                {% for usuario in usuarios %}
                <tr>
                    <td>{{usuario.nombre}}</td>
                    <td>{{usuario.usuario}}</td>
                    <td>{{usuario.correo}}</td>
                    <td>
                        <a href='#!' class='btn btn-info btn-small' id='editarUsuario' data-bs-toggle='modal' data-bs-target='#editarModal' data-id="{{usuario.id}}">Editar</a>
                        <a href='#!' class='btn btn-danger btn-small borrarUsuario' data-id="{{usuario.id}}">Borrar</a>
                    </td>
                </tr>
                {% endfor %}
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editarModalLabel">Editar Usuario</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="frmEmployee">
		  <div class="form-group">
		    <label for="nombre">Nombre</label>
		    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
		  </div>
		  <div class="form-group">
		    <label for="usuario">Usuario</label>
		    <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario">
		  </div>
		  <div class="form-group">
		    <label for="correo">Correo</label>
		    <input type="email" class="form-control" id="correo" name="correo" placeholder="Correo">
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <button type="button" id="btn-guardar" class="btn btn-primary">Guardar</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $('#editarModal').on('shown.bs.modal', function (e) {
            var id = $(e.relatedTarget).data('id');
            $('#nombre').val('');
            $('#usuario').val('');
            $('#correo').val('');
            $("#btn-guardar").on("click", function () {
                $.ajax({
                    url: '/usuarios/guardar/',
                    type: "POST",
                    cache: false,
                    data:{
                        id: id,
                        nombre: $('#nombre').val(),
                        usuario: $('#usuario').val(),
                        correo: $('#correo').val(),
                    },
                    beforeSend: function(){
                    },
                    complete: function(){
                    },
                    success: function() {
                        $('#editarModal').modal('hide');
                        location.reload();
                    }
                });
            });
        });

        $("#contenido").on("click", '.borrarUsuario', function () {
            var id = $(this).attr('data-id');
            $.ajax({
                url: '/usuarios/borrar/',
                type: "POST",
                cache: false,
                data:{
                    id: id,
                },
                beforeSend: function(){
                },
                complete: function(){
                },
                success: function(resultado) {
                    location.reload();
                }
            });
        });
    });
</script>