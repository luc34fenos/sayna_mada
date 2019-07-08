jQuery(document).ready(function($) {
    $(`input[type=radio]`).change(function(event) {
        var $userForm = $(`.user-form`);
        var lastSpan = $(`.user-form span:last`);
        var status = this.value;

        if (status == 'student') {
	        $userForm.html(`
	        	<span class="w3layouts_personal">
                    <label class="agileits_label" for="student_birthdate">Birthdate:</label>
                    <input type="date" id="student_birthdate" name="student[birthdate]" placeholder="93401" />
                </span>
        		<span class="w3_agile_personal">
                    <label class="agileits_label" for="student_country">Country:</label>
                    <input type="text" id="student_country" name="student[country]" placeholder="USA" />
                </span>
                <span class="agile_personal">
                    <label class="agileits_label" for="student_city">City:</label>
                    <input type="text" id="student_city" name="student[city]" placeholder="San Fransisco" />
                </span>    
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="student_address">Address:</label>
                    <input type="text" id="student_address" name="student[address]" placeholder="Somewhere on the earth" />
                </span>
                <span class="w3layouts_personal">
                    <label class="agileits_label" for="student_hobbies">Hobbies:</label>
                	<input id="student_hobbies" name="student[hobbies]" placeholder="Hacking - Playing Football - Playing baby foot - ..." />
                </span>
                <span class="w3layouts_personal">
                    <label class="agileits_label" for="student_summary">Summary:</label>
                	<textarea id="student_summary" name="student[summary]" placeholder="The only thing that I know is 'I don't know anything'"></textarea>
                </span>
	        `);
        } else if (status == 'business') {
        	$userForm.html(`
	        	<span class="w3layouts_personal">
                    <label class="agileits_label" for="businness_name">Company name:</label>
                    <input type="text" id="businness_name" name="business[name]" placeholder="Sayna" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="business_address">Company address:</label>
                    <input type="text" id="business_address" name="business[address]" placeholder="The nearest address" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="business_contact">Company contact:</label>
                    <input type="tel" id="business_contact" name="business[contact]" placeholder="XXX XX XXX XX" />
                </span>
                <span class="w3_agileits_personal">
                    <label class="agileits_label" for="business_email">Company email address:</label>
                    <input type="email" id="business_email" name="business[email]" placeholder="example@company.com" />
                </span>
	        `);
        } else {
        	$userForm.html(`
                <span class="w3_agile_personal">
                    <label class="agileits_label" for="user_country">Country:</label>
                    <input type="text" id="user_country" name="user[country]" placeholder="San Luis Obispo" />
                </span>
                <span class="agile_personal">
                    <label class="agileits_label" for="user_city">City:</label>
                    <input type="text" id="user_city" name="user[city]" placeholder="Your current city" />
                </span>
	        `);
        }
    })
})