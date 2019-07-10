jQuery(document).ready(function($) {
    $(".testform").simpleform({
        speed: 500,
        transition: 'fade',
        progressBar: true,
        showProgressText: true,
        validate: true
    });

    // Registration Conditions
    let input = $(`input#registration_condition`);
    let c = false;
    let submitButton = $(`input[value=Submit]:first`);

    input.change(function() {
        if (c) {
            submitButton.hide();
            c = false;
        } else {
            submitButton.show();
            c = true;
        }
    });
});