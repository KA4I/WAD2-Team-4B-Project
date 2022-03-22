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

    $('#add_btn').click(function() {
        var productIdVar, userIdVar;
        productIdVar = $(this).attr('data-productid');
        userIdVar = $(this).attr('data-user');

        $.get('/store/add_cart/',
            {'product_id': productIdVar, 'user': userIdVar},
            function(data) {
                $('#add_to_cart').html("Added!");
                $('#add_btn').hide();
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
$(document).on("click", ".remove_btn", function(){
    var productIdVar, userIdVar;
    productIdVar = $(this).attr('data-productid');
    userIdVar = $(this).attr('data-user');

    $.get('/store/remove_cart/',
    {'product_id': productIdVar, 'user': userIdVar},
    function(data) {
        $('#Removed').html("Removed an item, please refresh this page.");
        $('#remove_btn').hide();
    })
});
    