// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function search_onClick() {
  var text = $('#query').val();
  requestTextCorrection(text);
}

function requestTextCorrection(text) {
  var url = "/semantics_api/search";
  var data = { query: text };

  $.ajax({
    type: "POST",
    url: url,
    data: data,
    success: reportCorrection,
  });
}

function reportCorrection(resp){
  var rows = resp.rows;

  markupString = "<table>";
  markupString += "<th>Name</th><th>model</th><th>Price</th>";
  $.each(rows, function( i, row ) {
    markupString += "<tr>";

    $.each(row, function( i, data ) {
      markupString += "<td>" + data + "</td>";
    });

    markupString += "</tr>";
  });
  markupString += "</table>";

  $('#display').html(markupString);
}
