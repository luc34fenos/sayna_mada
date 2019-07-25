jQuery("document").ready(function($) {
    $(`input[type=checkbox]:first`).change(function(event) {
        let $userForm = $(`.user-form:first`);
        let $div = $(`div.toggle:first`);

        let inputs = $(`.user_status .inputs`);

        if ($div.hasClass('off')) {

            inputs.html(`
                <span class="agileits_personal">
                    <input value="0347739305" class="form-control" type="tel" id="student_tel" name="student[tel]" placeholder="Telephone personal" required="" />
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
                                <input class="form-control" type="date" id="student_birthdate" name="student[birthdate]" required="" />
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
        } else if ($div.hasClass('btn-success')) {
            inputs.html(`
                <span class="agileits_personal">
                    <input class="form-control" value="020 77 393 05" type="tel" id="company_tel" name="company[tel]" placeholder="Company contact" />
                </span>
            `);
            $userForm.html(`
                <div class="input-group-icon mt-10">
                    <div class="icon"><i class="fa fa-edit" aria-hidden="true"></i></div>
                    <input type="text" name="company[name]" id="company_name" placeholder="Nom de votre entreprise" class="single-input">
                </div>

                <div class="row">

                    <div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 input-group-icon mt-10">
                        <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
                        <input type="text" name="company[address]" id="company_address" placeholder="Address" class="single-input">
                    </div>


                    <div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 input-group-icon mt-10">
                        <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
                        <input type="text" name="company[legal_status]" id="company_legal_status" placeholder="Status légal" class="single-input">
                    </div>
                </div>

                <div class="input-group-icon mt-10">
                    <div class="icon"><i class="fa fa-globe" aria-hidden="true"></i></div>
                    <div class="form-select" id="default-select"">
                        <select name="company[start_date]" id="company_start_date" class="default-select">
                            <option value="">Année de décollage</option>
                        </select>
                    </div>
                </div>

                <div class="input-group-icon mt-10">
                    <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
                    <input type="text" name="company[activity_area]" id="company_activity_area" placeholder="Secteur d'activité" class="single-input">
                </div>

                <div class="input-group-icon mt-10">
                    <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
                    <input type="text" name="company[siret]" id="company_siret" placeholder="Siret" class="single-input">
                </div>
                
                <div class="mt-10">
                    <textarea name="company[other]" id="company_other" class="single-textarea" placeholder="Des informations additionnelles sur votre entreprise"></textarea>
                </div>
            `);
            for (var year = 1800; year < 2050; year++) {
                $('select#company_start_date').append(`
                    <option value="${year}">${year}</option>
                `);
            }
        } else {
            inputs.html(``);
            $userForm.html(``);
        }
    })

    function loadCities() {
        let country = document.getElementById("country");

        country.addEventListener("change", function() {
            $.ajax({
                url: "/states?country=" + country.value,
                type: "GET"
            })
        })
    };
    loadCities();
})