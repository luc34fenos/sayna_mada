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
                    <label class="agileits_label" for="student_hobbies">Hobbies</label>
                    <input class="form-control" id="student_hobbies" name="student[hobbies]" placeholder="Hacking - Playing Football - ..." />
                </span>
                <span class="w3layouts_personal">
                    <label class="agileits_label" for="student_summary">Summary</label>
                    <textarea class="form-control" id="student_summary" name="student[summary]" placeholder="The only thing that I know is 'I don't know anything'"></textarea>
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
                    <label class="agileits_label" for="company_phone">Company contact</label>
                    <input class="form-control" type="phone" id="company_phone" name="company[phone]" placeholder="XXX XX XXX XX" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="company_start_date">Company start_date</label>
                    <input class="form-control" type="email" id="company_start_date" name="company[start_date]" placeholder="example@company.com" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="company_legal_status">Company legal_status</label>
                    <input class="form-control" type="legal_status" id="company_legal_status" name="company[legal_status]" placeholder="example@company.com" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="company_activity_area">Company activity_area</label>
                    <input class="form-control" type="activity_area" id="company_activity_area" name="company[activity_area]" placeholder="example@company.com" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="company_siret">Company siret</label>
                    <input class="form-control" type="siret" id="company_siret" name="company[siret]" placeholder="example@company.com" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="company_other">Company other</label>
                    <input class="form-control" type="other" id="company_other" name="company[other]" placeholder="example@company.com" />
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
