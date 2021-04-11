// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

var jQuery = require('jquery');
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

// フォーム送信
$(document).on('turbolinks:load', function() {
    // modal表示
    var params = location.href;

    let getParams = function(params){
        const regex = /[?&]([^=#]+)=([^&#]*)/g;
        const params_obj = {};
        let match;
        while(match = regex.exec(params)){
            params_obj[match[1]] = match[2];
        }
        return params_obj;
    };

    if(Object.keys(getParams(params)).length){
        $.ajax('posts/' + getParams(params)['post_id'],
            {
                type: 'get',
            }
        )
    }

    // set flag
    let submitable_flags = {
        contact: {
            name: false,
            email: false,
            content: false
        },
        post: {
            title: false,
            overview: false,
            target: false,
            manner: false,
            reward: false,
            question: false
        },
        post_apply: {
            introduction: false,
        }
    };

    var regExp = /([^)]+)\[([^)]+)\]/;

    // contact

    $('.contact #name').keyup(function(){
        console.log('asdf');
        keyup_($(this));
    });

    $('.contact #email').keyup(function(){
        keyup_($(this));
    });

    $('.contact #content').keyup(function(){
        keyup_($(this));
    });

    // contact


    // post
    $('.post #title').keyup(function(){
        keyup_($(this));
    });

    $('.post #overview').keyup(function(){
        keyup_($(this));
    });

    $('.post #target').keyup(function(){
        keyup_($(this));
    });

    $('.post #manner').keyup(function(){
        keyup_($(this));
    });

    $('.post #reward').keyup(function(){
        keyup_($(this));
    });

    $('textarea')
        .on('keydown keyup keypress change', function () {
            $('textarea').each(function() {
                nested_keyup_($(this));
            });
        });
        $(document).on('keydown keyup keypress change', function () {
            $('textarea').each(function() {
                nested_keyup_($(this));
            });
        });

        $(function(){
            $('#btn').on('click', function() {
                var url = $('img_url').text();
                $('#ogp').val(url);
              });
        });
    // post

    // common
    let keyup_ = function (this_) {
        var tags = regExp.exec(this_.attr('name'))
        var count = this_.val().length;
        var wrapper = this_.parent()
        wrapper.removeClass('model_err');
        var counter_elms = wrapper.children().last().children();
        var counter_elm = counter_elms.first();
        counter_elm.text(count);
        var max_elm = counter_elms.last();
        var max = max_elm.text();
        submitable(tags, count, max, counter_elm);
    };

    let submitable = function (tags, count, max, counter_elm) {
        $('.btn').prop('disabled', true);
        if(count > 0 && max >= count){
            submitable_flags[tags[1]][tags[2]] = true;
            if(Object.values(submitable_flags[tags[1]]).every(x => x)) {
                $('.btn').prop('disabled', false);
            }
            counter_elm.removeClass('over_max');
        }else{
            submitable_flags[tags[1]][tags[2]] = false;
            $('.btn').prop('disabled', true);
            counter_elm.addClass('over_max');
        }
    };

    let nested_keyup_ = function (this_) {
        console.log(this_);
        var tags = regExp.exec(this_.attr('name'));
        var count = this_.val().length;
        var wrapper = this_.parent();
        wrapper.removeClass('model_err');
        var counter_elms = wrapper.children().last().children();
        var counter_elm = counter_elms.first();
        counter_elm.text(count);
        var max_elm = counter_elms.last();
        var max = max_elm.text();
        console.log(tags);
        tags = [null, 'post', tags[2]];
        console.log(tags);
        console.log(count);
        console.log(max);
        submitable(tags, count, max, counter_elm);
    };

    $(function() {
        function check_to_hide_or_show_add_link() {
            if ($('.post .nested-fields:visible').length == 5) {
                $('.post .links a').hide();
            } else {
                $('.post .links a').show();
            }
        }

        $('.post').on('cocoon:after-insert', function() {
            check_to_hide_or_show_add_link();
        });

        $('.post').on('cocoon:after-remove', function() {
            check_to_hide_or_show_add_link();
        });

        check_to_hide_or_show_add_link();
    });

});


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
