// $(document).ready(function () {
//       $("#popbtn").show({
//
//             });
//             return false;
//         });
//     });


// $(window).setTimeout(function(){
//    $('#popbtn').show(3000);
//     });

    //
    // $(document).setTimeout(function(){
    //   $('#popbtn').show(3000);
    // });
    //

// setTimeout(function(){$('#popbtn').modal('show');},3000);
//
// $(window).setTimeout(function(){
//     $('#popbtn').show();
// });
//
// function myFunction() {
//     var popup = document.getElementById("popbtn");
//     popup.classList.toggle("show");
// }

// setTimeout(function(){$('#popbtn').show(3000)};

//
// $(document).ready(function() {
//      $('#pops').hide().delay(3000).fadeIn(2200);
// });

function showButton() {
    document.getElementById("popbtn").style.display = "inline";
}

//this calls the function above, 3000 milliseconds is 3 seconds, adjust here to make it a longer interval
setTimeout("showButton()", 3000);
