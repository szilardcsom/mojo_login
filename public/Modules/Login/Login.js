$(function(){
  var LoginView = Backbone.View.extend({
    el: $("#loginform"),
    events: {
      'click #btn-login': 'doLogin'
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
      console.log('THIS',this.model);
    },
    
    doFBLogin: function() {
      console.log('THIS',this.model);
    },
  });
  
  var loginData = Backbone.Model.extend({});
  window.LoginView = new LoginView({model: new loginData()});
});