jQuery("document").ready(function($) {
    function update4Section(status) {
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
                        section3.html(`
                            <div class="col-sm-6 col-md-6">
                                <h4>Infos Personelles</h4>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="student_lastname">Nom et Prénom</label></span>
                                    </div>
                                    <input id="student_lastname" name="student[lastname]" type="text" class="form-control" placeholder="Nom de Famille" value="Hackerman">
                                    <input id="student_firstname" name="student[firstname]" type="text" class="form-control" placeholder="Prénom(s)" value="Rivaille">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="student_sexe">Sexe</label>
                                    </div>
                                    <select class="custom-select" name="student[sexe]" id="student_sexe">
                                        <!-- <option>Choisissez...</option> -->
                                        <option selected>Masculin</option>
                                        <option>Feminin</option>
                                        <option>Non spécifié</option>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="student_marital_status">Status Civil</label></span>
                                    </div>
                                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="student_marital_status" name="student[marital_status]" placeholder="Célibataire" value="Célibataire">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="student_birthdate">Date de naissance</label></span>
                                    </div>
                                    <input type="date" class="form-control" value="0820-11-01" name="student[birthdate]" id="student_birthdate">
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
                        section3.html(`
                            <div class="col-sm-6 col-md-6">
                                <h4>Infos Personelles</h4>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="company_name">Nom de l'entreprise</label></span>
                                    </div>
                                    <input id="company_name" name="company[name]" type="text" class="form-control" placeholder="Nom de l'entreprise" value="Sayna Madagascar">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="company_start_date">Date de lancement</label>
                                    </div>
                                    <select class="custom-select" name="company[start_date]" id="company_start_date">
                                        <option selected>2000</option>
                                        <option>2001</option>
                                        <option>2002</option>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="company_legal_status">Status légal</label></span>
                                    </div>
                                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="company_legal_status" name="company[legal_status]" placeholder="Status légal" value="Statut légal">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="company_activity_area">Secteur d'activité</label></span>
                                    </div>
                                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="company_activity_area" name="company[activity_area]" placeholder="Secteur d'activité" value="Secteur d'activité">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><label for="company_siret">Siret</label></span>
                                    </div>
                                    <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="company_siret" name="company[siret]" placeholder="Siret" value="Siret">
                                </div>
                                
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <h4>Détails supplémentaires</h4>
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Mes meilleurs loisirs" name="company[other]" id="company_other">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</textarea>
                                </div>
                            </div>
                        `)
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
                            <input id="student_address" name="student[address]" type="text" class="form-control" value="Lot FMAI 124 bis 67ha SUD">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputmask_3" class="col-sm-4 col-form-label col-form-label-sm">Mobile</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inputmask_3" name="student[tel]" value="0347739305">
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
                            <input id="company_address" name="company[address]" type="text" class="form-control" value="Lot FMAI 124 bis 67ha SUD">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputmask_3" class="col-sm-4 col-form-label col-form-label-sm">Mobile</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inputmask_3" name="company[tel]" value="0347739305">
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
    // $(`button.status`).click(function(event) {
    //     let btn = $(this),
    //         input = $(`input#registration_status`);

    //         $userForm = $(`.user-form:first`);

    //     let inputs = $(`.user_status .inputs`);

    //     if ($div.hasClass('off')) {

    //         inputs.html(`
    //             <span class="agileits_personal">
    //                 <input value="0347739305" class="form-control" type="tel" id="student_tel" name="student[tel]" placeholder="Telephone personal" required="" />
    //             </span>
    //         `);

    //         $userForm.html(`
    //             <div class="row">
    //                     <div class="col-md-6" style="padding-right: 2%">
    //                         <span class="w3l_personal">
    //                             <label class="agileits_label" for="student_lastname">Nom de famille</label>
    //                             <input value="A.N.Tsimanarson" class="form-control" type="text" id="student_lastname" name="student[lastname]" placeholder="Nom de famille" required="" />
    //                         </span>
    //                     </div>
    //                     <div class="col-md-6" style="padding-left: 2%">
    //                         <span class="w3l_personal">
    //                             <label class="agileits_label" for="student_firstname">Prénom</label>
    //                             <input value="Princy" class="form-control" type="text" id="student_firstname" name="student[firstname]" placeholder="Prénom" required="" />
    //                         </span>
    //                     </div>
    //                 </div>
    //                 <div class="row">
    //                     <div class="col-md-6" style="padding-right: 2%">
    //                         <span class="w3layouts_personal">
    //                             <label class="agileits_label" for="student_birthdate">Date de naissance</label>
    //                             <input class="form-control" type="date" id="student_birthdate" name="student[birthdate]" required="" />
    //                         </span>
    //                     </div>
    //                     <div class="col-md-6" style="padding-left: 2%">
    //                         <span class="w3_agileits_personal">
    //                             <label class="agileits_label" for="student_address">Addresse</label>
    //                             <input value="Lot FMAI 124 bis 67ha SUD" class="form-control" type="text" id="student_address" name="student[address]" placeholder="Somewhere on the earth" required="" />
    //                         </span>
    //                     </div>
    //                 </div>
    //                 <div class="row">
    //                     <div class="col-md-6" style="padding-right: 2%">
    //                         <span class="w3_agileits_personal">
    //                             <label class="agileits_label" for="student_sex">Sexe</label>
    //                             <select class="form-control" name="student[sexe]" id="student_sexe">
    //                                 <option>Homme</option>
    //                                 <option>Femme</option>
    //                                 <option>Non confirmé</option>
    //                             </select>
    //                         </span>
    //                     </div>
    //                     <div class="col-md-6" style="padding-left: 2%">
    //                         <span class="w3_agileits_personal">
    //                             <label class="agileits_label" for="student_marital_status">état civil</label>
    //                             <select class="form-control" name="student[marital_status]" id="student_marital_status">
    //                                 <option>Célibataire</option>
    //                                 <option>Marié</option>
    //                                 <option>Mariée</option>
    //                                 <option>Divorcé</option>
    //                                 <option>Divorcée</option>
    //                                 <option>Veuf</option>
    //                                 <option>Veuve</option>
    //                             </select>
    //                         </span>
    //                     </div>
    //                 </div>
    //                 <span class="w3layouts_personal">
    //                     <label class="agileits_label" for="cv_hobbies">Loisirs</label>
    //                     <input value="Hacking - Football - Volleyball" class="form-control" id="cv_hobbies" name="cv[hobbies]" />
    //                 </span>
    //                 <span class="w3layouts_personal">
    //                     <label class="agileits_label" for="cv_summary">Résumé</label>
    //                     <textarea class="form-control" id="cv_summary" name="cv[summary]" required="">
    //                         Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do tempor ut labore et dolore magna aliqua. Ut enim ad minim veniam, nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo. Duis aute irure dolor in reprehenderit in voluptate velit esse dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non, sunt in culpa qui officia deserunt mollit anim id est laborum.
    //                     </textarea>
    //                 </span>
    //         `);
    //     } else if ($div.hasClass('btn-success')) {
    //         inputs.html(`
    //             <span class="agileits_personal">
    //                 <input class="form-control" value="020 77 393 05" type="tel" id="company_tel" name="company[tel]" placeholder="Company contact" />
    //             </span>
    //         `);
    //         $userForm.html(`
    //             <div class="input-group-icon mt-10">
    //                 <div class="icon"><i class="fa fa-edit" aria-hidden="true"></i></div>
    //                 <input type="text" name="company[name]" id="company_name" placeholder="Nom de votre entreprise" class="single-input">
    //             </div>

    //             <div class="row">

    //                 <div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 input-group-icon mt-10">
    //                     <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
    //                     <input type="text" name="company[address]" id="company_address" placeholder="Address" class="single-input">
    //                 </div>


    //                 <div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 input-group-icon mt-10">
    //                     <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
    //                     <input type="text" name="company[legal_status]" id="company_legal_status" placeholder="Status légal" class="single-input">
    //                 </div>
    //             </div>

    //             <div class="input-group-icon mt-10">
    //                 <div class="icon"><i class="fa fa-globe" aria-hidden="true"></i></div>
    //                 <div class="form-select" id="default-select"">
    //                     <select name="company[start_date]" id="company_start_date" class="default-select">
    //                         <option value="">Année de décollage</option>
    //                     </select>
    //                 </div>
    //             </div>

    //             <div class="input-group-icon mt-10">
    //                 <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
    //                 <input type="text" name="company[activity_area]" id="company_activity_area" placeholder="Secteur d'activité" class="single-input">
    //             </div>

    //             <div class="input-group-icon mt-10">
    //                 <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
    //                 <input type="text" name="company[siret]" id="company_siret" placeholder="Siret" class="single-input">
    //             </div>

    //             <div class="mt-10">
    //                 <textarea name="company[other]" id="company_other" class="single-textarea" placeholder="Des informations additionnelles sur votre entreprise"></textarea>
    //             </div>
    //         `);
    //         for (var year = 1800; year < 2050; year++) {
    //             $('select#company_start_date').append(`
    //                 <option value="${year}">${year}</option>
    //             `);
    //         }
    //     } else {
    //         inputs.html(``);
    //         $userForm.html(``);
    //     }
    // })

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