<!-- Modal -->
<div class="modal fade modal-signin position-absolute py-5" tabindex="-1" id="modalSignin" data-backdrop="static" data-keyboard="false"  aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content rounded-4 shadow p-5">
      <div class="modal-header">
        <h5 class="modal-title fw-bold " id="staticBackdropLabel">Welcome back!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="" action="/account/login" method="post">
          <div class="form-group mb-3">
            <label for="username">Username</label>
            <input name="username" type="text" class="form-control rounded-3" id="username" placeholder="Username">
          </div>
          <div class="form-group mb-3">
            <label for="password">Password</label>
            <input name="password" type="password" class="form-control rounded-3" id="password" placeholder="Password">
          </div>

          <div class="form-group form-check mb-3">
            <input name="remember" type="checkbox" class="form-check-input" value="true" id="check-remember">
            <label class="form-check-label" for="check-remember">Remember</label>
          </div>

          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">Login</button>
        </form>
      </div>
    </div>
  </div>
</div>
