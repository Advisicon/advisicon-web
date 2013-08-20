function check(input) {
  if (input.value != $('#email_addr').value) {
    input.setCustomValidity('The two email addresses must match.');
  } else {
    input.setCustomValidity('');
  }
}