jQuery(document).ready(function($) {
    $(`input[type=radio]`).change(function(event) {
        var $userForm = $(`.user-form`);
        var lastSpan = $(`.user-form span:last`);
        var status = this.value;
        var icity = $(`select#city`);

        var inputs = $(`.user_status .inputs`);

        if (status == 'student') {
            icity.attr('name', 'student[city]');
            inputs.html(`
                <span class="agileits_personal">
                    <input class="form-control" type="tel" id="student_tel" name="student[tel]" placeholder="Personal phone" />
                </span>
            `);

            $userForm.html(`
                <span class="w3l_personal">
                    <label class="agileits_label" for="student_lastname">Lastname</label>
                    <input class="form-control" type="text" id="student_lastname" name="student[lastname]" placeholder="LASTNAME" />
                </span>
                <span class="w3l_personal">
                    <label class="agileits_label" for="student_firstname">Firstname</label>
                    <input class="form-control" type="text" id="student_firstname" name="student[firstname]" placeholder="Firstname" />
                </span>
                <span class="w3layouts_personal">
                    <label class="agileits_label" for="student_birthdate">Birthdate</label>
                    <input class="form-control" type="date" id="student_birthdate" name="student[birthdate]" placeholder="93401" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="student_address">Address</label>
                    <input class="form-control" type="text" id="student_address" name="student[address]" placeholder="Somewhere on the earth" />
                </span>
                <span class="w3layouts_personal">
                    <label class="agileits_label" for="cv_hobbies">Hobbies</label>
                    <input class="form-control" id="cv_hobbies" name="cv[hobbies]" placeholder="Hacking - Playing Football - ..." />
                </span>
                <span class="w3layouts_personal">
                    <label class="agileits_label" for="cv_summary">Summary</label>
                    <textarea class="form-control" id="cv_summary" name="cv[summary]" placeholder="The only thing that I know is 'I don't know anything'"></textarea>
                </span>
            `);
        } else if (status == 'company') {
            icity.attr('name', 'company[city]');
            inputs.html(`
                <span class="agileits_personal">
                    <input class="form-control" type="tel" id="company_tel" name="company[tel]" placeholder="Company contact" />
                </span>
            `);
            $userForm.html(`
                <span class="w3layouts_personal">
                    <label class="agileits_label" for="company_name">Company name</label>
                    <input class="form-control" type="text" id="company_name" name="company[name]" placeholder="Sayna Madagascar" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="company_address">Company address</label>
                    <input class="form-control" type="text" id="company_address" name="company[address]" placeholder="The nearest address" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="company_contact">Company contact</label>
                    <input class="form-control" type="tel" id="company_contact" name="company[contact]" placeholder="XXX XX XXX XX" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="company_email">Company email address</label>
                    <input class="form-control" type="email" id="company_email" name="company[email]" placeholder="example@company.com" />
                </span>
            `);
        } else {
            inputs.html(``);
            $userForm.html(``);
        }
    })

    function loadCities() {
        var country = document.getElementById("country");

        country.addEventListener("change", function() {
            Rails.ajax({
                url: "/states?country=" + country.value,
                type: "GET"
            })
        })
    };
    loadCities();
})