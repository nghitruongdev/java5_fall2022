<div class="products">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="filters">
          <ul>
            <li class="active" data-filter="*">All Products</li>
            <li data-filter=".des">Featured</li>
            <li data-filter=".dev">Flash Deals</li>
            <li data-filter=".gra">Last Minute</li>
          </ul>
        </div>
      </div>
      <div class="col-md-12">
        <div class="filters-content">
          <!-- add class: des | dev | gra | all-->
          <div class="row grid">
            <div class="col-lg-4 col-md-4 all des dev gra">
              <c:import url="_product-card.jsp"/>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-12">
        <c:import url="_pagination.jsp"/>
      </div>
    </div>
  </div>
</div>
