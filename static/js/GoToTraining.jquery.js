/*
 * GoToTraining API client (jQuery required) 
 */

//Constructor
var GoToTraining = function () {                                              // Declare a constant: GoToTraining
  "use strict";                                                               // ???
  var auth_tokens = {},                                                       // Declare an object within GoToTraining: auth_tokens. The first part is an empty object.
    args = Array.prototype.slice.call(arguments),                             // The second part is an Array of arguments (any length): args
    // the last argument is the callback
    callback = args.pop();                                                    // As the comment says, the last argument is the callback. This grabs it from the args Array.
  
  if(typeof args[0] === 'object'){                                            // if the first argument in the args Array is an Object...
    auth_tokens = args[0];                                                    //   ...then save the first argument as auth_tokens.
  }else if(typeof args[0] === 'function' || args[0] === undefined ){          // otherwise, if the first argument in the args Array is a function or is undefined...
    auth_tokens.access_token = GoToTraining.prototype.data.getAccessToken();  //   ...then run the getAccessToken method of the data method in GoToTraining and save it as the access_token method of auth_tokens.
  }else{                                                                      // and if nothing else applies (the first argument isn't an object, function, or undefined)...
    auth_tokens.organizer_key = args[0];                                      //   ...the first argument in the args Array is saved as the organizer_key method in auth_tokens, and
    if(typeof args[1] !== 'function'){                                        //     if the second argument in the args Array is not a function, and
      if(typeof args[2] !== 'function'){                                      //       if the third argument in the args Array is not a function either...
       auth_tokens.user = args[1];                                            //         ...save the second argument in the args Array as the user method of auth_tokens, and...
       auth_tokens.password = args[1];                                        //         ...save it as the password too
      }else{                                                                  //       otherwise (because the second argument in the args Array *is* a function)...
       auth_tokens.user_key = args[1];                                        //         ...save the second argument as the user_key method of auth_tokens
      }
    }
  }

  // make sure the function is called as a constructor
  if (!(this instanceof GoToTraining)) {                                      // if this is not an instance of GoToTraining
    return new GoToTraining(auth_tokens, callback);                           // create a new GoToTraining instance using the established auth_tokens and the callback
  }
  this.auth_tokens = auth_tokens;                                             // use the same auth_tokens, and

  // call callback
  callback(this);                                                             // ??? callback ??? ... I'm not sure what 'this' is here
};

GoToTraining.prototype = {                                                    // effect the prototype of GoToTraining
  'api_host': 'https://api.citrixonline.com/G2T/rest/organizers/' +           // declare the api_host method as a url beginning... (can I break it up like this? Is that allowed?)
              this.auth_tokens.organizer_key +                                //   ...insert the organizer_key into the url...
              '/trainings',                                                   //   ...and finish up with the last part of the url
  'api_methods': ['cancel_registration',                                      // declare the api_methods methods, starting with registrants methods...
                  'get_registrant', 
                  'get_training_registrants', 
                  'register_for_training', 
                  'get_attendance_details',
                  'get_organizers',                                           // ...then organizer methods...
                  'get_organizers_by_training',
                  'get_sessions_by_date_range',                               // ...then sessions methods...
                  'get_sessions_by_training',
                  'create_training',                                          // ...then trainings methods.
                  'delete_training',
                  'get_manage_training_url',
                  'get_training',
                  'get_trainings',
                  'update_training_name_and_description',
                  'update_training_organizers',
                  'update_training_registration_settings',
                  'update_training_times'],
  'request': function ( method, params, cb ) {
    var auth_headers = {};
    if(typeof params === 'function'){ cb = params; params = {};}
    else if( params === undefined){ params = {}; }
    if( this.auth_tokens.access_token === undefined ){
      if(this.auth_tokens.organizer_key){ params.organizer_key = this.auth_tokens.organizer_key;}
      if(this.auth_tokens.user_key){ params.user_key = this.auth_tokens.user_key;}
      if(this.auth_tokens.user){ params.user = this.auth_tokens.user;}
      if(this.auth_tokens.password){ params.password = this.auth_tokens.password;}
    }else{
      auth_headers = {'Authorization': 'Bearer ' + this.auth_tokens.access_token};
      params.access_token = this.auth_tokens.access_token;
    }
    
    $.ajax({
      url: this.api_host + method,
      data: params,
      type: 'GET',
      dataType: 'jsonp',
      headers: auth_headers,
      beforeSend: function(xhrObj){
        xhrObj.setRequestHeader("Content-Type","application/json");
        xhrObj.setRequestHeader("Accept","application/json");
        if(params.access_token !== undefined){
          xhrObj.setRequestHeader("Authorization","Bearer "+params.access_token);
        }
      },
      success: function (resp) {
        if(resp.contents !== undefined){
          cb(resp.contents);
        }else{
          cb(resp);
        }
      },
      failure: function (err) {
        console.log("Error connecting to Eventbrite API");
      }
    });
  },

  // various API client utility functions
  'utils': {
    'eventList': function( evnts, callback, options){
      var html = ['<div class="eb_event_list">'];
      if( evnts.events !== undefined ){
        var len = evnts.events.length;
        for( var i = 0; i < len; i++ ){
          if(evnts.events[i].event !== undefined ){
            html.push( callback( evnts.events[i].event, options ));

          }
        }
      }else{
        html.push('No events are available at this time.');
      }
      html.push('</div>');
      return html.join('\n');
    },
    'eventListRow': function( evnt ){
      var not_iso_8601 = /\d\d-\d\d-\d\d \d\d:\d\d:\d\d/;
      var date_string = not_iso_8601.test( evnt.start_date ) ? evnt.start_date.replace(' ', 'T') : evnt.start_date;
      var start_date = new Date( Date.parse( date_string ));
      var venue_name = 'Online'; //default location name
      var time_string = Eventbrite.prototype.utils.formatTime( start_date );
      var html = '';
      date_string = start_date.toDateString();
      if( evnt.venue !== undefined && evnt.venue.name !== undefined && evnt.venue.name !== ''){ 
          venue_name = evnt.venue.name;
      }
  	  if( venue_name !== undefined ){
  			venue_lng = evnt.venue.longitude;
  			venue_lat = evnt.venue.latitude;
  			venue_map_url = "https://maps.google.com/maps?q=" + venue_lat + "+" + venue_lng;
  	  }

      html = "<div class='eb_event_list_item' id='evnt_div_" + evnt.id + "'>" + 
             "<span class='eb_event_list_title'><a href='" + evnt.url + "' title='Register on eventbrite!'>" + evnt.title + "</a></span>" +
             "<span class='eb_event_list_location'><a href='" + venue_map_url + "' title='Map " + venue_name + " on google maps!'>" + venue_name + "</a></span>" +
             "<span class='eb_event_list_date'>" + date_string + "</span>" +
             "<div class='eb_event_list_details hidden'>" + evnt.description + "</div>" +
             "</div>";
      return html;
    },
    'formatTime': function( time ){
      var time_string = '';
      var minutes = time.getMinutes();
      var hours = time.getHours();
      var ampm = 'am';
      if( minutes < 10 ){
        minutes = '0' + minutes;
      }
      if( hours === 0 ){
        hours = 12;
      } else if ( hours >= 12 ){
        ampm = 'pm';
        if( hours !== 12){
          hours = hours - 12;
        }
      }
      return time_string += hours + ':' + minutes + ampm;
    },
    'login': function( options, cb ) {
      var response = {};
      if( options.error_message !== undefined ){
        if( options.error_message === 'access_denied' ){
          response.login_error = "Account access denied.";
        }else if( options.error_message !== 'disabled' ){
          response.login_error = options.error_message;
        }
      }
      // auto lookup of access_token from data-store
      if( options.access_token === undefined ){
        if( typeof options.get_token == 'function' ){
          options.access_token = options.get_token();
        }else if( options.get_token !== 'disabled' ){
          options.access_token = Eventbrite.prototype.data.getAccessToken();
        }
      }
      try{
        // Example using an access_token to initialize the API client:
        Eventbrite({'access_token': options.access_token}, function(eb){
          var resp = eb.user_get(function(resp){
            if( resp !== undefined && resp.user !== undefined){
              response.user_email = resp.user.email;
              response.user_name = resp.user.first_name + ' ' + resp.user.last_name;          
            }
            return cb(response);
          });
        });
      }catch(error){
        // This token may no longer be valid
        response.login_error = error;
        if( typeof options.delete_token === 'function' ){
          options.delete_token( options.access_token );
        }else if( options.delete_token !== 'disabled' ){
          Eventbrite.prototype.data.deleteAccessToken( options.access_token );
        }
        return cb(response);
      }
    },
    'logoutLink': function( ) {
      return Eventbrite.prototype.utils.logout;
    },
    'logout': function( organizer_key ) {
      // delete token and do other cleanup work
      Eventbrite.prototype.data.deleteAccessToken();
      Eventbrite.prototype.widget.login({'organizer_key': organizer_key }, function(widget_html){
        $('.eb_login_widget').replaceWith(widget_html);
      });
    },
    'oauthLink': function( key ) {
      return 'https://www.eventbrite.com/oauth/authorize?response_type=token&client_id=' + key;
    },
    'isLoggedIn': function() {
      var token = Eventbrite.prototype.data.getAccessToken();
      var isLogged = ( token !== undefined && token !== 'undefined' );
      return isLogged;
    }
  },
  'data': {
    'getAccessToken': function ( ){
      return localStorage.eb_access_token;
    },
    'saveAccessToken': function ( token ){
      localStorage.eb_access_token = token;
    },
    'deleteAccessToken': function ( token ){
      localStorage.eb_access_token = undefined;
    }
  },
  'widget': {
    'login': function( options, cb ){
      // automatically grab the access_token from the request fragment?
      if( window.location.hash.indexOf("token_type=Bearer") !== -1 &&  
          window.location.hash.indexOf("access_token=") !== -1 &&
          options.access_token === undefined ){  

        // if we have a new access_token: add it to "options", and save it
        if( window.location.hash.slice( window.location.hash.indexOf("access_token=") + 13 ).indexOf("&") !== -1){
          //partial fragment slice
          access_token = window.location.hash.slice( 
            window.location.hash.indexOf("access_token=") + 13,
            window.location.hash.indexOf("access_token=") + 13 + window.location.hash.slice( window.location.hash.indexOf("access_token=") + 13 ).indexOf("&") 
          );
        }else{
          //the rest of the string contains the access_token value
          access_token = window.location.hash.slice( window.location.hash.indexOf("access_token=") + 13 );
        }
        if( access_token !== -1 && access_token !== '' && options.save_token !== 'disabled'){
          if(typeof options.save_token == 'function'){
            options.save_token( access_token );
          }else{
            Eventbrite.prototype.data.saveAccessToken( access_token );
          }
          options.access_token = access_token;
          window.location.hash = '#';
        }
      }

      // automatically grab the access_token from storage?
      if( options.access_token === undefined && options.get_token !== 'disabled'){
        if(typeof options.get_token == 'function'){
          options.access_token = options.get_token();
        }else{
          options.access_token = Eventbrite.prototype.data.getAccessToken();
        }
      }
        
      // automatically grab errors from the querystring?
      if( options.error_message !== undefined && options.error_message == "disabled"){
        delete(options.error_message);
      }else if( options.error_message !== 'disabled' && window.location.search.indexOf("error=") !== -1 ){
        if( window.location.search.slice( window.location.search.indexOf("error=") + 6 ).indexOf("&") !== -1){
          options.error_message = window.location.search.slice( 
            window.location.search.indexOf("error=") + 6,
            window.location.search.indexOf("error=") + 6 + window.location.search.slice( window.location.search.indexOf("error=") + 6 ).indexOf("&") 
          );
        }else{
          options.error_message = window.location.search.slice( window.location.search.indexOf("error=") + 6 );
        }
      }

      //  Check to see if we have a valid user account
      //  and Proccess any data-related work:
      Eventbrite.prototype.utils.login( options, function(response){
        //  package up the data for our view / template:
        var login_params = {};
        if(options.logout_link !== 'disabled'){
          login_params.logout_link = options.logout_link;
        }
        login_params.oauth_link = options.oauth_link;
        if( login_params.oauth_link === undefined ){
          login_params.oauth_link = Eventbrite.prototype.utils.oauthLink(options.organizer_key);
        }
        if( login_params.logout_link === undefined ){
          login_params.logout_link = "Eventbrite.prototype.utils.logout('" + options.organizer_key + "');";
        }
        if( response !== undefined && typeof response == 'object'){
          if( response.user_email !== undefined ){
            login_params.user_name = response.user_name,
            login_params.user_email = response.user_email;
          }
          if( response.login_error !== undefined ){
            login_params.login_error = response.login_error;
          }
        }
          
        // view related work:
        //  render your "template"
        if( typeof options.renderer == 'function' ){
          return cb(options.renderer( login_params ));
        }else if(options.renderer == 'disabled' ){
          //return the raw data for use with an external template
          return cb(login_params);
        }else{
          //use our default renderer:
          return cb(Eventbrite.prototype.widget.loginHTML( login_params ));  
        }
      });
    },
    'loginHTML': function( strings ) {
      // Replace this example with something that works with your Application's templating engine
      html = ["<div class='eb_login_widget'>"];
      html.push("<style type='text/css'>.eb_login_btn{width:162px;height:24px;display:block;text-indent: -99999px;background: url('http://evbdn.eventbrite.com/s3-s3/static/images/developer/oauth2/oauth-connect-btns.png') top;}\n.eb_login_btn:hover{background-position: 0px 24px;} .eb_logout{text-align:right;}</style>");
      if( strings.user_name   !== undefined &&
          strings.user_email  !== undefined && 
          strings.logout_link !== undefined ){
        html.push("<div><p><b>Welcome Back!</b></p>");
        html.push("<p>You are logged in as:<br/>"+ strings.user_name + "<br/><i>(" + strings.user_email + ")</i></p>");
        if(strings.logout_link !== 'disabled'){
        html.push("<p class='eb_logout'><a class='button' href='#' onclick=\"" + strings.logout_link + "\">Logout</a></p>");
        }
        html.push("</div>");
      }else if( strings.oauth_link !== undefined ){
        if(strings.login_error !== undefined){
          html.push("<p class='error'>" + strings.login_error + "</p>");
        }
        html.push("<p><a class='eb_login_btn' target='_top' href='" + strings.oauth_link + "'>Connect to Eventbrite</a></p>");
      }else{
        html.push("<div><b>Eventbrite widgetHTML template example fail :(</b></div>");
      }  
      html.push("</div>");
      return html.join("\n");
    },
    'ticket': function( evnt ) {
      return '<div style="width:100%; text-align:left;"><iframe  src="http://www.eventbrite.com/tickets-external?eid=' + evnt.id + '&ref=etckt" frameborder="0" height="192" width="100%" vspace="0" hspace="0" marginheight="5" marginwidth="5" scrolling="auto" allowtransparency="true"></iframe><div style="font-family:Helvetica, Arial; font-size:10px; padding:5px 0 5px; margin:2px; width:100%; text-align:left;"><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com/r/etckt">Online Ticketing</a><span style="color:#ddd;"> for </span><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com/event/' + evnt.id + '?ref=etckt">' + evnt.title + '</a><span style="color:#ddd;"> powered by </span><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com?ref=etckt">Eventbrite</a></div></div>';
    },
    'registration': function( evnt ) {
      return '<div style="width:100%; text-align:left;"><iframe  src="http://www.eventbrite.com/event/' + evnt.id + '?ref=eweb" frameborder="0" height="1000" width="100%" vspace="0" hspace="0" marginheight="5" marginwidth="5" scrolling="auto" allowtransparency="true"></iframe><div style="font-family:Helvetica, Arial; font-size:10px; padding:5px 0 5px; margin:2px; width:100%; text-align:left;"><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com/r/eweb">Online Ticketing</a><span style="color:#ddd;"> for </span><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com/event/' + evnt.id + '?ref=eweb">' + evnt.title + '</a><span style="color:#ddd;"> powered by </span><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com?ref=eweb">Eventbrite</a></div></div>';
    },
    'calendar': function ( evnt ) {
      return '<div style="width:195px; text-align:center;"><iframe  src="http://www.eventbrite.com/calendar-widget?eid=' + evnt.id + '" frameborder="0" height="382" width="195" marginheight="0" marginwidth="0" scrolling="no" allowtransparency="true"></iframe><div style="font-family:Helvetica, Arial; font-size:10px; padding:5px 0 5px; margin:2px; width:195px; text-align:center;"><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com/r/ecal">Online event registration</a><span style="color:#ddd;"> powered by </span><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com?ref=ecal">Eventbrite</a></div></div>';
    }, 
    'countdown': function ( evnt ) {
      return '<div style="width:195px; text-align:center;"><iframe  src="http://www.eventbrite.com/countdown-widget?eid=' + evnt.id + '" frameborder="0" height="479" width="195" marginheight="0" marginwidth="0" scrolling="no" allowtransparency="true"></iframe><div style="font-family:Helvetica, Arial; font-size:10px; padding:5px 0 5px; margin:2px; width:195px; text-align:center;"><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com/r/ecount">Online event registration</a><span style="color:#ddd;"> for </span><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com/event/' + evnt.id + '?ref=ecount">' + evnt.title + '</a></div></div>';
    }, 
    'button': function ( evnt ) {
      return '<a href="http://www.eventbrite.com/event/' + evnt.id + '?ref=ebtn" target="_blank"><img border="0" src="http://www.eventbrite.com/custombutton?eid=' + evnt.id + '" alt="Register for ' + evnt.title + ' on Eventbrite" /></a>';
    }, 
    'link': function ( evnt, text, color ) {
      return '<a href="http://www.eventbrite.com/event/' + evnt.id + '?ref=elink" target="_blank" style="color:' + ( color || "#000000" ) + ';">' + ( text || evnt.title ) + '</a>';
    } 
  }
};

(function(){
  var len = Eventbrite.prototype.api_methods.length;
  function addMethod ( method ) { 
    Eventbrite.prototype[method] = function( params, callback) {
      this.request( method, params, callback );
    };   
  }
  for ( var i = 0; i < len ; i += 1 ){
    addMethod( Eventbrite.prototype.api_methods[i] );
  }
}());


// including the following progressive enhancement for ISO 8601 dates - Thanks Colin Snover!
/**
 * Date.parse with progressive enhancement for ISO 8601 <https://github.com/csnover/js-iso8601>
 * © 2011 Colin Snover <http://zetafleet.com>
 * Released under MIT license.
 */
(function (Date, undefined) {
  var origParse = Date.parse, numericKeys = [ 1, 4, 5, 6, 7, 10, 11 ];
  Date.parse = function (date) {
    var timestamp, struct, minutesOffset = 0;
    // ES5 §15.9.4.2 states that the string should attempt to be parsed as a Date Time String Format string
    // before falling back to any implementation-specific date parsing, so that’s what we do, even if native
    // implementations could be faster
    //              1 YYYY                2 MM       3 DD           4 HH    5 mm       6 ss        7 msec        8 Z 9 ±    10 tzHH    11 tzmm
    if ((struct = /^(\d{4}|[+\-]\d{6})(?:-(\d{2})(?:-(\d{2}))?)?(?:T(\d{2}):(\d{2})(?::(\d{2})(?:\.(\d{3}))?)?(?:(Z)|([+\-])(\d{2})(?::(\d{2}))?)?)?$/.exec(date))) {
      // avoid NaN timestamps caused by “undefined” values being passed to Date.UTC
      for (var i = 0, k; (k = numericKeys[i]); ++i) {
        struct[k] = +struct[k] || 0;
      }
      // allow undefined days and months
      struct[2] = (+struct[2] || 1) - 1;
      struct[3] = +struct[3] || 1;
      if (struct[8] !== 'Z' && struct[9] !== undefined) {
        minutesOffset = struct[10] * 60 + struct[11];
        if (struct[9] === '+') {
          minutesOffset = 0 - minutesOffset;
        }
      }
      timestamp = Date.UTC(struct[1], struct[2], struct[3], struct[4], struct[5] + minutesOffset, struct[6], struct[7]);
    } else {
      timestamp = origParse ? origParse(date) : NaN;
    }
    return timestamp;
  };
}(Date));
