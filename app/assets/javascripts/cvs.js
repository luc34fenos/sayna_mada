$(document).ready(function($) {
    function addSkill(div, cv_id, name) {
    	
    }

    function addLanguage(div, cv_id, name) {

    }

    function addProgrammingLanguage(div, cv_id) {
    	
    }


    function addBackground(div, cv_id, name) {
    	
    }

    function addCoverLetter(div, cv_id, name) {
    	
    }

    function addVideo(div, cv_id, name) {
    	
    }

    function addExperience(div, cv_id, name) {
    	
    }

    // Remove
    function removeLanguage(div, cv_id, id) {

    }

    function removeProgrammingLanguage(div, cv_id, id) {
    	
    }

    function removeSkill(div, cv_id, id) {
    	
    }

    function removeBackground(div, cv_id, id) {
    	
    }

    function removeCoverLetter(div, cv_id, id) {
    	
    }

    function removeVideo(div, cv_id, id) {
    	
    }

    function removeExperience(div, cv_id, id) {
    	
    }



    // function updateCV() {
    //     $(`a#update`).click(function(event) {
    //         event.preventDefault();
    //         $(`form#updateCV`).submit();
    //     });
    // }
    // updateCV();

    // $(".add-more").click(function(e) {
    //     e.preventDefault();

    //     let id = this.id;

    //     let div = $(`div.${id}:first`);
    //     let children = $(`div.${id}:first div.${id.slice(0, this.id.length-1)}`);

    //     let newInput;

    //     if (id == "experiences") {
    //         newID = children.length + 1;
    //         newInput = `
    //           <div id="experience${newID}" class="field experience form-group col-md-4 row new">
    //             <input type="text" id="exp${newID}0" name="expnames[name${newID}]" class="form-control">
    //             <div class="actions collapse row">
    //               <div class="col-md-10" style="padding: 0 0 0 2%;">
    //                 <textarea id="exp${newID}1" name="expdescriptions[description${newID}]" class="level form-control col-md-10"></textarea>
    //               </div>
    //               <div class="col-md-2" style="padding: 0 0 0 2%;">
    //                 <a id="rmexperience${newID}" class="remove-me"><i class="fa fa-trash"></i></a>
    //               </div>
    //             </div>
    //           </div>
    //         `;
    //     } else if (id == "languages") {
    //         newID = children.length + 1;
    //         newInput = `
    //           <div id="language${newID}" class="field language form-group col-md-4 row new">
    //             <input type="text" id="language${newID}0" name="languagenames[name${newID}]" class="form-control">
    //             <div class="actions collapse row">
    //               <div class="col-md-10" style="padding-left: 0;">
    //                 <% 5.times do  %>
    //                 <span class="glyphicon glyphicon-star-empty col-md-2" style="padding-left: 5%;position: relative;top: 2px;margin: 0 1%; color: gold;"></span>
    //                 <% end %>
    //               </div>
    //               <div class="col-md-2" style="padding: 0;">
    //                 <a id="rmlanguage${newID}" class="remove-me"><i class="fa fa-trash"></i></a>
    //               </div>
    //             </div>
    //           </div>
    //         `;
    //     } else if (id == "programming_languages") {
    //         newID = children.length + 1;
    //         newInput = `
    //           <div id="programming_language${newID}" class="field programming_language form-group col-md-4 row new">
    //             <input type="text" id="programming_language${newID}0" name="programming_languagenames[name${newID}]" class="form-control">
    //             <div class="actions collapse row">            
    //               <div class="col-md-10" style="padding-left: 0;">
    //                 <% 5.times do  %>
    //                 <span class="glyphicon glyphicon-star-empty col-md-2" style="padding-left: 5%;position: relative;top: 2px;margin: 0 1%; color: gold;"></span>
    //                 <% end %>
    //               </div>
    //               <div class="col-md-2" style="padding: 0 0 0 2%;">
    //                 <a id="rmprogramming_language${newID}" class="remove-me" style="float: right;"><i class="fa fa-trash"></i></a>
    //               </div>
    //             </div>
    //           </div>
    //         `;
    //     } else {
    //         newInput = ``;
    //     }

    //     $(div).append(newInput);

    //     updateDiv();
    //     updateLevel();
    //     destroyDiv();
    //     toggleActions();
    // });

    // function destroyDiv() {
    //     $(".remove-me").click(function(e) {
    //         e.preventDefault();
    //         let id = this.id.slice(2, this.id.length);
    //         let div = $(this).parents('.field:first');
    //         div.fadeOut('slow', function() {
    //             div.remove();

    //             if (div.hasClass('old')) {
    //                 let $ID;

    //                 if (div.hasClass('experience')) {
    //                     $ID = div.attr('id').slice('experience'.length, div.attr('id').length);
    //                     $.ajax({
    //                         url: `/experiences/${$ID}`+`?&authenticity_token=`+`AUTH_TOKEN`,
    //                         method: 'DELETE',
    //                         data: {
    //                             id: $ID
    //                         }
    //                     });
    //                 }
    //                 if (div.hasClass('programming_language')) {
    //                     $ID = div.attr('id').slice('programming_language'.length, div.attr('id').length);
    //                     $.ajax({
    //                         url: `/programming_languages/${$ID}`+`?&authenticity_token=`+`AUTH_TOKEN`,
    //                         method: 'DELETE',
    //                         data: {
    //                             id: $ID
    //                         }
    //                     });
    //                 }
    //                 if (div.hasClass('language')) {
    //                     $ID = div.attr('id').slice('language'.length, div.attr('id').length);
    //                     $.ajax({
    //                         url: `/languages/${$ID}`+`?&authenticity_token=`+`AUTH_TOKEN`,
    //                         method: 'DELETE',
    //                         data: {
    //                             id: $ID
    //                         }
    //                     });
    //                 }
    //             }
    //         });
    //     });
    // }

    // function updateDiv() {
    //     $(`input`).focusout(function(event) {
    //         event.preventDefault();
    //         let div = $(this).parents('.field:first');
    //         if (div.hasClass('old')) { // update
    //             let $ID, $NAME, $LEVEL, $URL;
    //             $NAME = this.value;
    //             if (div.hasClass('experience')) {
    //                 $ID = div.attr('id').slice('experience'.length, div.attr('id').length);
    //                 $URL = `/experiences/${$ID}`;
    //             } else if (div.hasClass('language')) {
    //                 $ID = div.attr('id').slice('language'.length, div.attr('id').length);
    //                 $URL = `/languages/${$ID}`;
    //             } else if (div.hasClass('programming_language')) {
    //                 $ID = div.attr('id').slice('programming_language'.length, div.attr('id').length);
    //                 $URL = `/programming_languages/${$ID}`;
    //             }
    //             if (div.hasClass('experience') || div.hasClass('skill') || div.hasClass('language') || div.hasClass('programming_language')) {
    //                 $.ajax({
    //                     url: $URL+`?&authenticity_token=`+`AUTH_TOKEN`,
    //                     type: 'PATCH',
    //                     data: {
    //                         id: $ID,
    //                         name: $NAME
    //                     }
    //                 });
    //             }
    //         } else if (div.hasClass('new')) { // create
    //             let $CVID, $NAME, $URL;
    //             $CVID = $(`div.moncv:first`).attr('id');
    //             $NAME = this.value;
    //             if (div.hasClass('experience')) {
    //                 $URL = `/experiences`;
    //             } else if (div.hasClass('programming_language')) {
    //                 $URL = `/programming_languages`;
    //             } else if (div.hasClass('language')) {
    //                 $URL = `/languages`;
    //             }

    //             if ($NAME != "") {
    //                 $.ajax({
    //                     url: $URL+`?&authenticity_token=`+`AUTH_TOKEN`,
    //                     type: 'POST',
    //                     data: {
    //                         cv_id: $CVID,
    //                         name: $NAME
    //                     }
    //                 });
    //                 div.addClass('old');
    //             }
    //         }
    //     });
    //     $(`textarea`).focusout(function(event) {
    //         let div = $(this).parents('.field:first');

    //         $(`a#update`).css({
    //             'background-color': 'gold',
    //             'text-transform': 'uppercase'
    //         });

    //         if (div.hasClass('old')) {
    //             let $ID, $CONTENT, $URL;
    //             $CONTENT = this.value;
    //             if (div.hasClass('experience')) {
    //                 $ID = div.attr('id').slice('experience'.length, div.attr('id').length);
    //                 $URL = `/experiences/${$ID}`;
    //             }

    //             $.ajax({
    //                 url: $URL+`?&authenticity_token=`+`AUTH_TOKEN`,
    //                 type: 'PATCH',
    //                 data: {
    //                     id: $ID,
    //                     description: $CONTENT
    //                 }
    //             });
    //         }
    //     });
    // }

    // function updateLevel() {
    //     $(`span.glyphicon`).click(function(event) {
    //         event.preventDefault();
    //         let div = $(this).parents('.field:first');

    //         $(`a#update`).css({
    //             'background-color': 'gold',
    //             'text-transform': 'uppercase'
    //         });

    //         if (div.hasClass('old')) {
    //             updateDiv();
    //             let $ID, $LEVEL, $URL;
    //             let parent = $(this).parent('div');
    //             let siblings = parent.children('span.glyphicon');

    //             $LEVEL = Number(siblings.index(this)) + 1;

    //             for (let i = siblings.length - 1; i >= 0; i--) {
    //                 if (siblings.index(siblings.eq(i)) <= siblings.index(this)) {
    //                     siblings.eq(i).removeClass('glyphicon-star-empty');
    //                     siblings.eq(i).addClass('glyphicon-star');
    //                 } else {
    //                     siblings.eq(i).removeClass('glyphicon-star');
    //                     siblings.eq(i).addClass('glyphicon-star-empty');
    //                 }
    //             }

    //             if (div.hasClass('language')) {
    //                 $ID = div.attr('id').slice('language'.length, div.attr('id').length);
    //                 $URL = `/languages/${$ID}`;
    //             } else if (div.hasClass('programming_language')) {
    //                 $ID = div.attr('id').slice('programming_language'.length, div.attr('id').length);
    //                 $URL = `/programming_languages/${$ID}`;
    //             }

    //             $.ajax({
    //                 url: $URL+`?&authenticity_token=`+`AUTH_TOKEN`,
    //                 type: 'PATCH',
    //                 data: {
    //                     id: $ID,
    //                     level: $LEVEL
    //                 }
    //             });
    //         }
    //     });
    // }

    // function updateSkill() {
    //     let $input = $("#skills input"),
    //     $CVID = $(`div.moncv:first`).attr('id'),
    //     $appendHere = $(".tagHere"),
    //     oldKey = 0,
    //     newKey,
    //     TABKEY = 9;
    //     $input.focus();

    //     $input.keydown(function(e) {

    //         if (e.keyCode == TABKEY) {
    //             if (e.preventDefault) {
    //                 e.preventDefault();
    //                 if ($(this).val() == '' || $(this).val() == ' ') {
    //                     return false;
    //                 } else {
    //                   $NAME = $(this).val();
    //                   $.ajax({
    //                     url: '/skills'+`?&authenticity_token=`+`AUTH_TOKEN`,
    //                     type: 'POST',
    //                     data: { 
    //                       cv_id: $CVID,
    //                       name: $NAME
    //                     },
    //                   });
    //                 }
                    
    //                 addTag($(this));
    //             }
    //             return false;
    //         }

    //         if ($(this).val() == '' && e.keyCode === 8) { // Destroy
    //           let $tag = $(".tag:last-child"),
    //           $a = $tag.children('a.skill'),
    //           $ID = $a.attr('id').slice('skill'.length, $a.attr('id').length);

    //           if ($tag.hasClass('old')) {
    //             $.ajax({
    //               url: `/skills/${$ID}`+`?&authenticity_token=`+`AUTH_TOKEN`,
    //               type: 'DELETE',
    //               data: { 
    //                 id: $ID
    //               },
    //             });
    //           }
    //           $tag.remove();
    //         }

    //     })

    //     function addTag(element) { // Create
    //       let $tag = $("<div />"),
    //         $a = $(`<a href='#' class="skill new"/>`),
    //         $span = $("<span />");
    //       $tag.addClass('tag');
    //       $tag.addClass('new');
    //       $('<i class="fa fa-times" aria-hidden="true"></i>').appendTo($a);
          
    //       $span.text($(element).val());

    //       $a.bind('click', function(e) {
    //         e.preventDefault();
    //         $(this).parent().remove();
    //         $(this).unbind('click');
    //       });

    //       $a.appendTo($tag);
    //       $span.appendTo($tag);
    //       $tag.appendTo($appendHere);
    //       $(element).val('');
    //     }
    // }
    // updateSkill();

    // function destroySkill(){
    //   let $a = $(`#skills a.skill`),
    //   $ID;
    //   $a.bind('click', function(e) {
    //     e.preventDefault();
    //     $ID = this.id.slice('skill'.length, this.id.length);
    //     $(this).parent().remove();
    //     $(this).unbind('click');

    //     if ($a.parent('div.tag').hasClass('old')) {
    //       $.ajax({
    //         url: `/skills/${$ID}`+`?&authenticity_token=`+`AUTH_TOKEN`,
    //         type: 'DELETE',
    //         data: { 
    //           id: $ID
    //         },
    //       });
    //     }
    //   });
    // }
    // destroySkill();

    // function toggleActions() {
    //     let div = $(`.field`);
    //     div.hover(function() {
    //         let actions = $(this).children('.actions:first');
    //         actions.slideDown('fast');
    //     }, function() {
    //         let actions = $(this).children('.actions:first');
    //         actions.slideUp('fast');
    //     });
    // }

    // updateDiv();
    // updateLevel();
    // destroyDiv();
    // toggleActions();






    // // Update
    // function addLanguage(div, cv_id) {
    // 	let $input = $("#skills input"),
    //     $CVID = $(`div.moncv:first`).attr('id'),
    //     $appendHere = $(".tagHere"),
    //     oldKey = 0,
    //     newKey,
    //     TABKEY = 9;
    //     $input.focus();

    //     $input.keydown(function(e) {

    //         if (e.keyCode == TABKEY) {
    //             if (e.preventDefault) {
    //                 e.preventDefault();
    //                 if ($(this).val() == '' || $(this).val() == ' ') {
    //                     return false;
    //                 } else {
    //                   $NAME = $(this).val();
    //                   $.ajax({
    //                     url: '/skills'+`?&authenticity_token=`+`AUTH_TOKEN`,
    //                     type: 'POST',
    //                     data: { 
    //                       cv_id: $CVID,
    //                       name: $NAME
    //                     },
    //                   });
    //                 }
                    
    //                 addTag($(this));
    //             }
    //             return false;
    //         }

    //         if ($(this).val() == '' && e.keyCode === 8) { // Destroy
    //           let $tag = $(".tag:last-child"),
    //           $a = $tag.children('a.skill'),
    //           $ID = $a.attr('id').slice('skill'.length, $a.attr('id').length);

    //           if ($tag.hasClass('old')) {
    //             $.ajax({
    //               url: `/skills/${$ID}`+`?&authenticity_token=`+`AUTH_TOKEN`,
    //               type: 'DELETE',
    //               data: { 
    //                 id: $ID
    //               },
    //             });
    //           }
    //           $tag.remove();
    //         }

    //     })

    //     function addTag(element) { // Create
    //       let $tag = $("<div />"),
    //         $a = $(`<a href='#' class="skill new"/>`),
    //         $span = $("<span />");
    //       $tag.addClass('tag');
    //       $tag.addClass('new');
    //       $('<i class="fa fa-times" aria-hidden="true"></i>').appendTo($a);
          
    //       $span.text($(element).val());

    //       $a.bind('click', function(e) {
    //         e.preventDefault();
    //         $(this).parent().remove();
    //         $(this).unbind('click');
    //       });

    //       $a.appendTo($tag);
    //       $span.appendTo($tag);
    //       $tag.appendTo($appendHere);
    //       $(element).val('');
    //     }
    // }
})