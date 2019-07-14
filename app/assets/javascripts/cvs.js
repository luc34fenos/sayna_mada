// $(document).ready(function($) {
    
//     $(".add-more").click(function(e) {
//         e.preventDefault();

//         let id = this.id;

//         let div = $(`div.${id}:first`);
//         let child = $(`div.${id}:first div:last`);
//         let children = $(`div.${id}:first div.col-md-4`);

//         let newInput;

//         if (id == "experiences") {
//             newInput = `
//                 <div id="experience${children.length}" class="experience form-group col-md-4 row">
//                     <div class="col-md-11">
//                         <select id="exp${children.length}" name="experiences[exp${children.length}]" class="form-control">
//                             <option>exp1</option>
//                             <option>exp2</option>
//                             <option>exp3</option>
//                         </select>
//                     </div>
//                     <div class="col-2 col-sm-1 col-md-1 col-lg-1 remove">
//                         <a id="rmexperience${children.length}" class="btn btn-danger remove-me" >x</a>
//                     </div>
//                 </div>
//             `;
//         } else if (id == "skills") {
//             newInput = `
//                 <div id="skill${children.length}" class="skill form-group col-md-4 row">
//                     <div class="col-md-11">
//                         <select id="skill${children.length}" name="skills[skill${children.length}]" class="form-control">
//                             <option>skill1</option>
//                             <option>skill2</option>
//                             <option>skill3</option>
//                         </select>
//                     </div>
//                     <div class="col-2 col-sm-1 col-md-1 col-lg-1 remove">
//                         <a id="rmskill${children.length}" class="btn btn-danger remove-me" >x</a>
//                     </div>
//                 </div>
//             `;
//         } else if (id == "languages") {
//             newInput = `
//                 <div id="language${children.length}" class="language form-group col-md-4 row">
//                     <div class="col-md-11">
//                         <select id="language${children.length}" name="languages[language${children.length}]" class="form-control">
//                             <option>language1</option>
//                             <option>language2</option>
//                             <option>language3</option>
//                         </select>
//                     </div>
//                     <div class="col-2 col-sm-1 col-md-1 col-lg-1 remove">
//                         <a id="rmlanguage${children.length}" class="btn btn-danger remove-me" >x</a>
//                     </div>
//                 </div>
//             `;
//         } else if (id == "programming_languages") {
//             newInput = `
//                 <div id="programming_language${children.length}" class="programming_language form-group col-md-4 row">
//                     <div class="col-md-11">
//                         <select id="programming_language${children.length}" name="programming_languages[programming_language${children.length}]" class="form-control">
//                             <option>programming_language1</option>
//                             <option>programming_language2</option>
//                             <option>programming_language3</option>
//                         </select>
//                     </div>
//                     <div class="col-2 col-sm-1 col-md-1 col-lg-1 remove">
//                         <a id="rmprogramming_language${children.length}" class="btn btn-danger remove-me" >x</a>
//                     </div>
//                 </div>
//             `;
//         } else {
//             newInput = ``;
//         }

//         $(div).append(newInput);

//         $(".remove-me").click(function(e) {
//             e.preventDefault();

//             let id = this.id.slice(2, this.id.length);
//             let div = $(`div#${id}`);
//             div.fadeOut('slow', function() {
//                 div.remove();
//             });
//         });
//     });
// })