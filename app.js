// all require file
var express = require('express'); /* calling express core file  */
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
//var flash = require('req-flash');
var flash = require('express-flash-notification');
var session = require('express-session');
var expressValidator = require('express-validator');
var methodOverride = require('method-override');
var connection  = require('express-myconnection'); 
var mysql = require('mysql');

//var upload = require('./lib/upload');


// create object of express file 
var app = express();
app.use(cookieParser());
 app.use(
		connection(mysql,{
							host: '127.0.0.1',
							user: 'root', // your mysql user
							password : '', // your mysql password
							port : 3306, //port mysql
							database:'foodstore' // your database name
						},
					'pool') //or single
      );

app.use(expressValidator());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(session({secret:"secretpass123456"}));	

	  

//app.use(flash({ locals: 'flash' }));


var flashNotificationOptions = {
  beforeSingleRender: function(item, callback) {
    if (item.type) {
      switch(item.type) {
        case 'GOOD':
          item.type = 'Success';
          item.alertClass = 'alert-success';
          break;
        case 'OK':
          item.type = 'Info';
          item.alertClass = 'alert-info';
          break;
        case 'BAD':
          item.type = 'Error';
          item.alertClass = 'alert-danger';
          break;
      }
    }
    callback(null, item);
  }
};
// Flash Notification Middleware Initialization
app.use(flash(app, flashNotificationOptions))

app.use(expressValidator());

// view engine setup

app.set('0', path.join(__dirname, 'views'));
app.use(express.static(path.join(__dirname, 'public')));

app.set('view engine', 'ejs');


//set home page routes
app.get('/', function (req, res) {
  res.render('home',{title:"Daizik"});
 })

/* app.get('/test', function(req,res) {
    req.flash('success', 'Registration successfully');
    res.locals.message = req.flash();
 
    res.redirect('/');
}); */

var admin = require('./routes/admin.js');

app.use('/admin', admin);

var cms = require('./routes/cms.js');
app.use('/admin/cms', cms);

/*app.use(function (req, res, next) {

 if (req.session.is_login) 
		{ 
			
			
			var userid = req.session.userid ;

         
            req.getConnection(function(err,connection)
			{

			var query = connection.query('SELECT `username`,`admin_pis`  FROM tbl_admin_users where id='+req.session.userid, function(err,rows){

						if(err)
							{
								console.log(err.code);
							}
							else
							{
								if(rows.length <=0)
								{
									console.log('Wrong email address or password. Try again.');
								}
								else
								{	
								      var user_nickname = rows[0].username;
     								  var user_pics= rows[0].admin_pis;
     								  app.locals.username = user_nickname ;
     								  app.locals.user_pics = user_pics ;
     								  // res.locals.username = app.locals.username ;
     								  //res.locals.user_pics = app.locals.user_pics;
     								  //console.log(username);usernameuser_pics
									  //console.log(user_pics);
									 
								}
							}





			});

			});

		} 
})*/


//app.use('/dashboard',dashboard);

app.listen(3000);