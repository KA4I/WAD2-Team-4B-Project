$(document).ready(function() {
    $('#like_btn').click(function() {
        var productIdVar;
        productIdVar = $(this).attr('data-productid');

        $.get('/store/like_product/',
            {'product_id': productIdVar},
            function(data) {
                $('#like_count').html(data);
                $('#like_btn').hide();
            })
    });

    $('#order_btn').click(function() {
        var productIdVar, userIdVar;
        productIdVar = $(this).attr('data-productid');
        userIdVar = $(this).attr('data-user');

        $.get('/store/order_product/',
            {'product_id': productIdVar, 'user': userIdVar},
            function(data) {
                $('#Order').html("Ordered!");
                $('#order_btn').hide();
            })
    });
});
    