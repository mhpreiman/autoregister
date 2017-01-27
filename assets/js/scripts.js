$(document).ready(function(){
    
//Datepicker for YEAR (aasta)
$('.datepicker-autod').datepicker({
    format: "yyyy",
    startView: "years", 
    minViewMode: "years",
    autoclose: true
});
   
//Select option from dropdown when clicked
$(".dropdown-menu li a").click(function(){
    $(".btn:first-child").html($(this).text());
});
    
});