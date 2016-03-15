define(function() {
  var Login = function() {
    var that = this;
    
    var LoginView = Backbone.View.extend({
      el: $("#loginform"),
      events: {
        'click #btn-login': 'doSimpleLogin',
        'click #btn-fblogin': 'doFBLogin'
      },
      
      initialize: function(){
        var self = this;
        
        this.username = $("#login-username");
        this.password = $("#login-password");
        
        this.username.change(function(e){
          self.model.set({username: $(e.currentTarget).val()});
        });
        this.password.change(function(e){
          self.model.set({password: $(e.currentTarget).val()});
        });
      },    
      
      doSimpleLogin: function() {
        this.model.save();
      },
      
      doFBLogin: function() {
        //self.model.set({fbLogin: 1});
        //this.model.save();
        
        that.checkFBLoginState();      
      }
    });
    
    //Init Backbone View/Module -------------------------------------------------
    
    var LoginModel = Backbone.Model.extend({
      urlRoot: '/login',
      defaults: {
        username: '',
        password: ''
      }
    });
    
    this.loginModel = new LoginModel(); 
    this.loginView = new LoginView({model: this.loginModel });
    
    //Integrate FB Api ----------------------------------------------------------
    
    window.fbAsyncInit = function() {
      FB.init({
        appId      : '1410388035851683',
        xfbml      : true,
        version    : 'v2.5'
      });
    };

    (function(d, s, id){
       var js, fjs = d.getElementsByTagName(s)[0];
       if (d.getElementById(id)) {return;}
       js = d.createElement(s); js.id = id;
       js.src = "//connect.facebook.net/en_US/sdk.js";
       fjs.parentNode.insertBefore(js, fjs);
     }(document, 'script', 'facebook-jssdk')); 
  };
  
  Login.prototype.checkFBLoginState = function() {
    var that = this;
    
    FB.getLoginStatus(function(response) {
      that.statusChangeCallback(response);
    });  
  };
  
  Login.prototype.statusChangeCallback = function(response) {
    console.log('statusChangeCallback');
    console.log(response);
    
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      this.getFBAccountData();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      FB.login();
    } else {
      alert('Log into your FB please!');
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
    }
  };
  
  Login.prototype.getFBAccountData = function(response) {
    var that = this;
    
    FB.api('/me?fields=id,name,hometown,gender,email', function(response) {
      console.log(response);
      
      that.loginModel.set({fbId: response.id});
      that.loginModel.set({username: response.name});
      that.loginModel.save();
    });
  }; 
    
  return Login;
});

//@ sourceURL=Login.js