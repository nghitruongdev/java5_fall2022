<form action="/product/search" class="row">
  <div class="col-10">
    <div class="row">
      <div class="mb-3 col-6">
        <label for="price-min" class="form-label">Min Price</label>
        <input type="number" name="min" value="${min}" class="form-control" id="price-min" placeholder="Min?">
      </div>
      <div class="mb-3 col-6">
        <label for="price-max" class="form-label">Max Price</label>
        <input type="number" name="max" value="${max}" class="form-control" id="price-max" placeholder="Max?">
      </div>
    </div>
  </div>
  <div class="mt-3 col-2 align-items-center d-flex">
    <button class="btn btn-primary">Search</button>
  </div>
</form>