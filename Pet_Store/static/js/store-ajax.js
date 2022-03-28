$(document).ready(function() {
    function round(value, decimals) {
        return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
    }
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

    $('#add_btn').click(function() {
        var productIdVar, userIdVar;
        productIdVar = $(this).attr('data-productid');
        userIdVar = $(this).attr('data-user');

        $.get('/store/add_cart/',
            {'product_id': productIdVar, 'user': userIdVar},
            function(data) {
                $('#add_to_cart').html("Added!");
            })
    });

    $('#order_btn').click(function() {
        var userIdVar;
        userIdVar = $(this).attr('data-user');

        $.get('/store/order_cart/',
            {'user': userIdVar},
            function(data) {
                $('#Order').html("Ordered!");
                $('#order_btn').hide();
            })
    });

    $('.quantity_store').keyup(function() {
        var userIdVar, quantity, productIdVar;
        var element = $(this);

        userIdVar = $('#order_btn').attr('data-user');
        productIdVar = $(this).attr('data-productid');
        quantity = parseInt($(this).val());
        
        

        $.get('/store/update_cart/',
            {'user': userIdVar, 'quantity':quantity, 'product_id': productIdVar},
            function(data) {
                var total = 0
                $('.quantity_store').each(function(i, obj) {
                    total += parseFloat($(obj).attr('data-productprice')*parseInt($(obj).val()));
                });
                $(element).attr('value', quantity);
                $('#total_cost').attr('value', round(total,2));
                $('#total_cost').text("Total: £" +  round(total,2));
            })
    });


    //$('#remove_btn').click(function() {
        //var productIdVar, userIdVar;
        //productIdVar = $(this).attr('data-productid');
        //userIdVar = $(this).attr('data-user');

        //$.get('/store/remove_cart/',
            //{'product_id': productIdVar, 'user': userIdVar},
            //function(data) {
                //$('#Remove').html(0);
                //$('#remove_btn').hide();
            //})
    //});
});
$(document).on("click", ".u-cart-remove-item", function(){
    var productIdVar, userIdVar;
    productIdVar = $(this).attr('data-productid');
    userIdVar = $(this).attr('data-user');

    $.get('/store/remove_cart/',
    {'product_id': productIdVar, 'user': userIdVar},
    function(data) {
        $('#'+productIdVar).remove();
        var total = 0
        $('.quantity_store').each(function(i, obj) {
            total += parseFloat($(obj).attr('data-productprice')*parseInt($(obj).val()));
        });
        $('#total_cost').attr('value', round(total,2));
        $('#total_cost').text("Total: £" + round(total,2));
    })
});
    