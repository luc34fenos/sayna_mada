jQuery("document").ready(function($) {
    $(`input[type=radio]`).change(function(event) {
        var $userForm = $(`.user-form`);
        var lastSpan = $(`.user-form span:last`);
        var status = this.value;

        var inputs = $(`.user_status .inputs`);

        if (status == 'student') {

            inputs.html(`
                <span class="agileits_personal">
                    <input class="form-control" type="tel" id="student_tel" name="student[tel]" placeholder="Personal phone" />
                </span>
            `);

            $userForm.html(`
                <div class="row">
                        <div class="col-md-6" style="padding-right: 2%">
                            <span class="w3l_personal">
                                <label class="agileits_label" for="student_lastname">Nom de famille</label>
                                <input value="A.N.Tsimanarson" class="form-control" type="text" id="student_lastname" name="student[lastname]" placeholder="Nom de famille" required="" />
                            </span>
                        </div>
                        <div class="col-md-6" style="padding-left: 2%">
                            <span class="w3l_personal">
                                <label class="agileits_label" for="student_firstname">Prénom</label>
                                <input value="Princy" class="form-control" type="text" id="student_firstname" name="student[firstname]" placeholder="Prénom" required="" />
                            </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6" style="padding-right: 2%">
                            <span class="w3layouts_personal">
                                <label class="agileits_label" for="student_birthdate">Date de naissance</label>
                                <input class="form-control" type="date" id="student_birthdate" name="student[birthdate]" placeholder="03X XXX XX XXX" required="" />
                            </span>
                        </div>
                        <div class="col-md-6" style="padding-left: 2%">
                            <span class="w3_agileits_personal">
                                <label class="agileits_label" for="student_address">Addresse</label>
                                <input value="Lot FMAI 124 bis 67ha SUD" class="form-control" type="text" id="student_address" name="student[address]" placeholder="Somewhere on the earth" required="" />
                            </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6" style="padding-right: 2%">
                            <span class="w3_agileits_personal">
                                <label class="agileits_label" for="student_sex">Sexe</label>
                                <select class="form-control" name="student[sexe]" id="student_sexe">
                                    <option>Homme</option>
                                    <option>Femme</option>
                                    <option>Non confirmé</option>
                                </select>
                            </span>
                        </div>
                        <div class="col-md-6" style="padding-left: 2%">
                            <span class="w3_agileits_personal">
                                <label class="agileits_label" for="student_marital_status">état civil</label>
                                <select class="form-control" name="student[marital_status]" id="student_marital_status">
                                    <option>Célibataire</option>
                                    <option>Marié</option>
                                    <option>Mariée</option>
                                    <option>Divorcé</option>
                                    <option>Divorcée</option>
                                    <option>Veuf</option>
                                    <option>Veuve</option>
                                </select>
                            </span>
                        </div>
                    </div>
                    <span class="w3layouts_personal">
                        <label class="agileits_label" for="cv_hobbies">Loisirs</label>
                        <input value="Hacking - Football - Volleyball" class="form-control" id="cv_hobbies" name="cv[hobbies]" />
                    </span>
                    <span class="w3layouts_personal">
                        <label class="agileits_label" for="cv_summary">Résumé</label>
                        <textarea class="form-control" id="cv_summary" name="cv[summary]" required="">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do tempor ut labore et dolore magna aliqua. Ut enim ad minim veniam, nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo. Duis aute irure dolor in reprehenderit in voluptate velit esse dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </textarea>
                    </span>
            `);
        } else if (status == 'company') {
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
                    <label class="agileits_label" for="company_start_date">Company start_date</label>
                    <input class="form-control" type="text" id="company_start_date" name="company[start_date]" placeholder="example@company.com" />
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
            $.ajax({
                url: "/states?country=" + country.value,
                type: "GET"
            })
        })
    };
    loadCities();
})