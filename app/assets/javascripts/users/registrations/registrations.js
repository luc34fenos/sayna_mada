jQuery("document").ready(function($) {
    function update4Section(status) {
        btn = $(`button.status`),
            status = btn.val();

        btn.click(function(event) {
            let email = $(`#user_email`).val(),
                username = $(`#user_username`).val(),

                city = $(`#city`).val(),

                tel = $(`#inputmask_3`).val(),

                address = $(`#student_address`).val() || $(`#company_address`).val(),

                first = $(`#student_firstname`).val(),
                last = $(`#student_lastname`).val(),
                birth = $(`#student_birthdate`).val(),

                name = $(`#company_name`).val(),
                start = $(`#company_start_date`).val(),
                legalStatus = $(`#company_legal_status`).val(),
                activityArea = $(`#company_activity_area`).val(),
                siret = $(`#company_siret`).val(),
                other = $(`#company_other`).val(),

                section3 = $(`.step3:first`),
                section4 = $(`.step4:first`);

            status = $(this).val();

            switch (status) {
                case "student":
                    section3.html(`
                            <div class="col-sm-6 col-md-6">
                                <h4>Infos Personelles</h4>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="student_lastname">Nom et Prénom</label></span>
                                    </div>
                                    <input required id="student_lastname" name="student[lastname]" type="text" class="form-control" placeholder="Nom de Famille" value="Hackerman">
                                    <input required id="student_firstname" name="student[firstname]" type="text" class="form-control" placeholder="Prénom(s)" value="Rivaille">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="student_sexe">Sexe</label>
                                    </div>
                                    <select class="custom-select" name="student[sexe]" id="student_sexe">
                                        <option selected>Masculin</option>
                                        <option>Feminin</option>
                                        <option>Non spécifié</option>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="student_marital_status">Status Civil</label></span>
                                    </div>
                                    <input required type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="student_marital_status" name="student[marital_status]" placeholder="Célibataire" value="Célibataire">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="student_birthdate">Date de naissance</label></span>
                                    </div>
                                    <input required type="date" class="form-control" value="0820-11-01" name="student[birthdate]" id="student_birthdate">
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <h4>Infos pour le CV</h4>
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Mon résumé" name="cv[summary]" id="cv_summary">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</textarea>
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Mes meilleurs loisirs" name="cv[hobbies]" id="cv_hobbies">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</textarea>
                                </div>
                            </div>
                        `)
                    break;
                case "company":
                    section3.html(`
                            <div class="col-sm-6 col-md-6">
                                <h4>Infos préalables</h4>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="company_name">Nom de l'entreprise</label></span>
                                    </div>
                                    <input required id="company_name" name="company[name]" type="text" class="form-control" placeholder="Nom de l'entreprise" value="Sayna Madagascar">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="company_start_date">Date de lancement</label>
                                    </div>
                                    <select class="custom-select" name="company[start_date]" id="company_start_date">
                                        <option>2000</option>
                                        <option>2001</option>
                                        <option>2002</option>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="company_legal_status">Status légal</label></span>
                                    </div>
                                    <input required type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="company_legal_status" name="company[legal_status]" placeholder="Status légal" value="Statut légal">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="company_activity_area">Secteur d'activité</label></span>
                                    </div>
                                    <input required type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="company_activity_area" name="company[activity_area]" placeholder="Secteur d'activité" value="Secteur d'activité">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="company_siret">Siret</label></span>
                                    </div>
                                    <input required type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="company_siret" name="company[siret]" placeholder="Siret" value="Siret">
                                </div>
                                
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <h4>Détails supplémentaires</h4>
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Mes meilleurs loisirs" name="company[other]" id="company_other">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</textarea>
                                </div>
                            </div>
                        `)
                    break;
                default:
                    // statements_def
                    break;

            }
        });
        setTimeout(function(event) {
            let email = $(`#user_email`).val(),
                username = $(`#user_username`).val(),

                city = $(`#city`).val(),

                tel = $(`#inputmask_3`).val(),

                address = $(`#student_address`).val() || $(`#company_address`).val(),

                first = $(`#student_firstname`).val(),
                last = $(`#student_lastname`).val(),
                birth = $(`#student_birthdate`).val(),

                name = $(`#company_name`).val(),
                start = $(`#company_start_date`).val(),
                legalStatus = $(`#company_legal_status`).val(),
                activityArea = $(`#company_activity_area`).val(),
                siret = $(`#company_siret`).val(),
                other = $(`#company_other`).val(),

                section3 = $(`.step3:first`),
                section4 = $(`.step4:first`);

            status = $(`button.status.btn-primary:first`).val();

            switch (status) {
                case "student":
                    section4.html(`
                            <div class="form-group row">
                                <div class="col-sm-12" id="check-infos">
                                    <ul class="list-unstyled">
                                        <li>Pseudo: ${username}</li>
                                        <li>Email: ${email}</li>
                                        <li>Prénom : ${first} </li>
                                        <li>Nom : ${last} </li>
                                        <li>Date de naissance : ${birth} </li>
                                        <li>Ville: ${city} </li>
                                        <li>Addresse: ${address} </li>
                                        <li>Mobile: ${tel} </li>
                                    </ul>
                                </div>
                            </div>
                        `)
                    break;
                case "company":
                    section4.html(`
                            <div class="form-group row">
                                <div class="col-sm-12" id="check-infos">
                                    <ul class="list-unstyled">
                                        <li>Pseudo: ${username}</li>
                                        <li>Email: ${email}</li>
                                        <li>Nom de l'entreprise : ${name}</li>
                                        <li>Date de lancement : ${start}</li>
                                        <li>Status légal : ${legalStatus}</li>
                                        <li>Siret : ${siret} </li>
                                        <li>Secteur d'activité : ${activityArea}</li>
                                        <li>Ville de lancement: ${city}</li>
                                        <li>Addresse: ${address}</li>
                                        <li>Mobile: ${tel}</li>
                                    </ul>
                                </div>
                            </div>
                        `)
                    break;
                default:
                    // statements_def
                    break;
            }

            update4Section(status);
        }, 1000);
    }
    let status = "student";
    update4Section(status);

    $(`button.status`).click(function(event) {
        let activeBtn = $(this),
            othersBtn = $(`button.status`)
        coord = $(`div#coord`);

        othersBtn.removeClass('btn-primary')
            .addClass('btn-outline-primary');

        activeBtn.addClass('btn-primary')
            .removeClass('btn-outline-primary');

        switch (activeBtn.text()) {
            case "Etudiant":
                coord.html(`
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label col-form-label-sm" for="student_address">Address </label>
                        <div class="col-sm-6">
                            <input required id="student_address" name="student[address]" type="text" class="form-control" value="Lot FMAI 124 bis 67ha SUD">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputmask_3" class="col-sm-4 col-form-label col-form-label-sm">Mobile</label>
                        <div class="col-sm-6">
                            <input required type="text" class="form-control" id="inputmask_3" name="student[tel]" value="0347739305">
                            <small class="form-text text-muted">Example : 999 99 999 99</small>
                        </div>
                    </div>
                `);
                break;
            case "Entreprise":
                coord.html(`
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label col-form-label-sm" for="company_address">Address </label>
                        <div class="col-sm-6">
                            <input required id="company_address" name="company[address]" type="text" class="form-control" value="Lot FMAI 124 bis 67ha SUD">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputmask_3" class="col-sm-4 col-form-label col-form-label-sm">Mobile</label>
                        <div class="col-sm-6">
                            <input required type="text" class="form-control" id="inputmask_3" name="company[tel]" value="0347739305">
                            <small class="form-text text-muted">Example : 999 99 999 99</small>
                        </div>
                    </div>
                `);
                break;
            default:
                // statements_def
                break;
        }
    });

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