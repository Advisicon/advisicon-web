function check(input) {
  if (input.value != document.getElementById('email_addr').value) {
    input.setCustomValidity('The two email addresses must match.');
  } else {
    input.setCustomValidity('');
  }
}

$('#submit').click(function() {
  if ($('form')[0].checkValidity()) {
    // form execution code
    var fullName  = $('input#full_name').val();
    var company   = $('input#company_name').val();
    var emailAddr = $('input#email_addr').val();
    var phone     = $('input#phone').val();

    var dataString = 'name=' + fullName + '&company=' + company + '&email=' + emailAddr + '&phone=' + phone ;

    $.ajax({
      url:  "scripts/mail.php",
      type: 'POST',
      data: dataString,
      success: function(msg){
        disablePopupContact();
        $('#popupMessageSent').css('visibility', 'visible');
      },
      error: function() {
        alert('Bad submit');
      }
    });

  } else {
    // form invalid code
  }
});