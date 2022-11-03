<!-- Bootstrap core JavaScript -->
<script src="../assets/vendor/jquery/jquery.min.js"></script>
<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Additional Scripts -->
<script src="../assets/js/custom.js"></script>
<script src="../assets/js/owl.js"></script>
<script src="../assets/js/slick.js"></script>
<script src="../assets/js/isotope.js"></script>
<script src="../assets/js/accordions.js"></script>

<script>
    cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
    function clearField(t) {                   //declaring the array outside of the
        if (!cleared[t.id]) {                      // function makes it static and global
            cleared[t.id] = 1;  // you could use true and false, but that's more typing
            t.value = '';         // with more chance of typos
            t.style.color = '#fff';
        }
    }
</script>
<script type="text/javascript">
    $(() => {
        let cart = localStorage.getItem('cart');
        if (!sessionStorage.getItem("isLoaded") && cart)
            $.ajax({
                url: '/cart/api/load',
                type: 'POST',
                data: cart,
                dataType: "JSON",
                contentType: "application/json",
                success: (data) => {
                    $('#cart-badge').text(data);
                    console.log(data)
                }
            })
        sessionStorage.setItem("isLoaded", true);
        $.ajax({
            url: '/cart/api/getAll',
            success: (data) => {
                localStorage.setItem('cart', JSON.stringify(data));
            }
        })
    });
</script>