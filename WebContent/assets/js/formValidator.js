/**
 * created by wuwujun on 2016/10/25
 */

$(document).ready(function() {
    $('#login-form').bootstrapValidator({
        excluded: [':disabled', ':hidden', ':not(:visible)'],
        feedbackIcons: {
        	 valid: 'fa fa-check',
        	 invalid: 'fa fa-times',
        	 validating: 'fa fa-refresh'
        },
        live: 'enabled',
        message: 'This value is not valid',
        submitButtons: 'button[type="submit"]',
        trigger: null,
        submitHandler: null,
        fields: {
            userName: {
                validators: {
                    notEmpty: {
                        message: 'The email is required'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required'
                    }
                }
            },
        },
    });
});
