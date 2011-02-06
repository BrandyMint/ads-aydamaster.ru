// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
    $(".best_in_place").best_in_place();
    $('input.ui-date-picker').datepicker({ dateFormat: 'dd/mm/yy', firstDay: 1 });
});
