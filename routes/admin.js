var express = require('express')
var router = express.Router();
var http = require("http");
var authentication_mdl = require('../middlewares/authentication');
var session_store;
var server = http.createServer(express);
var md5 = require('md5');

var multer  = require('multer');



//var upload = multer({ dest: 'uploads/' })
//var fileUpload = require('express-fileupload');

// define the home page route
router.get('/', function (req, res) {
 //res.locals.message = req.flash();	
  res.render('signup');
})
// define the about route
router.get('/dashboard',authentication_mdl.is_login, function (req, res) {
	//console.log(username);
   res.render('admin/dashboard' , { title: "Ecommerce Dashboard" , username : req.session.user_nickname ,page_name: 'dashboard'  });
})

router.get('/signin', function (req, res) {
  res.send('yes its sigin')
})
/*======================= authentication and login logout section start here =================*/
router.post('/checkvalidation' , function(req,res,next){
	
	   
		session_store=req.session;
		req.assert('txtEmail', 'Please fill the Username').notEmpty();
		req.assert('txtEmail', 'Email not valid').isEmail();
		req.assert('txtPassword', 'Please fill the Password').notEmpty();
		var errors = req.validationErrors();
		if (!errors) 
		{
			req.getConnection(function(err,connection)
			{
				       //console.log(req.body);
						v_pass = req.sanitize( 'txtPassword' ).escape().trim(); 
						v_email = req.sanitize( 'txtEmail' ).escape().trim();
						var query = connection.query('select * from tbl_admin_users where email="'+v_email+'" and password=md5("'+v_pass+'")',function(err,rows)
						{
							if(err)
							{
								var errornya  = ("Error Selecting : %s ",err.code );  
								 req.flash('BAD', errornya , '/admin/');
							}
							else
							{
								if(rows.length <=0)
								{
                                    var errors_detail = "Wrong email address or password. Try again." ;
									 req.flash('BAD', errors_detail , '/admin/');
                                   
								}
								else
								{	
								      var user = rows[0].id;
     								  var password= rows[0].password;
	                                  var user_nickname = rows[0].username;
     								  var user_pics= rows[0].admin_pis;
									 session_store.is_login = true;
									 session_store.userid = user; 
									 session_store.user_nickname = user_nickname;
									 session_store.user_pics = user_pics; 
									 res.redirect('/admin/dashboard/');
								}
							}

						});
			  });
		}
		else
		{
			errors_detail = "<p>Sory there are error</p><ul>";
			for (i in errors) 
			{ 
				error = errors[i]; 
				errors_detail +='<li>'+error.msg+'</li>';  
			} 
		   errors_detail += "</ul>";
		   console.log(errors_detail);
		   req.flash('BAD', errors_detail , '/admin/');
		 
		}		
		
	
});


router.get('/logout', function(req, res)
{ 
	req.session.destroy(function(err)
	{ 
		if(err)
		{ 
			console.log(err); 
		} 
		else 
		{ 
			res.redirect('/admin/'); 
		} 
	}); 
});

/*=====================  authentication and login logout section end here =======================*/

/* profile information updatation start */

router.get('/profile',authentication_mdl.is_login, function (req, res ,next)
 {
		req.getConnection(function(err,connection)
		{
				var query = connection.query('SELECT * FROM tbl_admin_users where id='+req.session.userid, function(err,rows)
				{
						if(err)
						{
							var errornya  = ("Error Selecting : %s ",err );  
							 req.flash('BAD', errornya , '/admin/dashboard/');
						}
						else
						{
							if(rows.length <=0)
							{
							
								res.redirect('/admin/dashboard/');
							}
							else
							{	
							  
								res.render('admin/my-profile' , { title: "Update Profile Information" , data:rows[0] ,info_one :"Manange profile Information" , info_two :"Ecommerce Admin Template" , info_three :"Dashboard" , info_four :"Manage Profile Information" , info_five :"Profile Information Modification Form" , username : req.session.user_nickname , page_name: 'dashboard'});
							}		
						}
				 });	
		// console.log(query.sql); its basically use to print a query 	
		});
  
})


router.post('/updateprofileinfo',function(req,res,next)
{
	    session_store=req.session;
	   //res.redirect('/admin/dashboard/');
	    console.log(req.body);
		req.assert('first_name' ,'Please Enter Your First Name').notEmpty();
		req.assert('middle_name' ,'Please Enter Your Middle Name').notEmpty();
		req.assert('last_name' ,'Please Enter Your Last Name').notEmpty();
		req.assert('email' ,'Please Enter Your Email').notEmpty();
		req.assert('contact' ,'Please Enter Your Contact Information').notEmpty();
		req.assert('fb_link' ,'Please Enter Your Fackbook Link').notEmpty();
		req.assert('tw_link' ,'Please Enter Your Twitter Link').notEmpty();
		req.assert('paypal_id' ,'Please Enter Your Paypal Signature').notEmpty();
		req.assert('email_signature' ,'Please Enter Your Email Signature').notEmpty();
		
		var errors = req.validationErrors();
		req.getConnection(function(err,connection)
		{
			if(!errors)
			{
				v_first_name = req.sanitize( 'first_name' ).escape().trim(); 
				v_middle_name = req.sanitize( 'middle_name' ).escape().trim();
				v_last_name = req.sanitize( 'last_name' ).escape().trim();
				v_email = req.sanitize( 'email' ).escape();
				v_contact = req.sanitize( 'contact' ).escape();
				v_fb_link = req.sanitize( 'fb_link' );
				v_tw_link = req.sanitize( 'tw_link' );
				v_paypal_id = req.sanitize( 'paypal_id' );
				v_email_signature = req.sanitize( 'email_signature' );
				v_admin_name = v_first_name+" "+v_middle_name+" "+v_last_name ;
				
				var adminprofile = {
										first_name: v_first_name,
										middle_name: v_middle_name,
										last_name: v_last_name,
										admin_name : v_admin_name ,
										email:v_email,
										contact:v_contact,
										fb_link:v_fb_link,
										tw_link:v_tw_link, 
									    paypal_id:v_paypal_id,
										email_signature:v_email_signature
									};
			   var update_admin_profile ='update tbl_admin_users set ? where id='+req.session.userid;
         		req.getConnection(function(err,connection)
				{
						var query =  connection.query(update_admin_profile,adminprofile,function(err,rows)
							{
								if(err)
								{
									var errors_detail  = ("Error Update : %s ",err ); 
									 req.flash('BAD', errors_detail , '/admin/profile/');
								}
								else
								{
									var sucess_detail = 'Profile Update Sucessfully ';
									 req.flash('GOOD', sucess_detail , '/admin/profile/');
								}	
						
							});
				});
					
	      }
		 else
		 {
		      errors_detail = "<p>Sory there are error</p><ul>";
			  for (i in errors) 
			  { 
				 error = errors[i]; 
				 errors_detail +='<li>'+error.msg+'</li>';  
			  } 
		      errors_detail += "</ul>";
		      console.log(errors_detail);
		      req.flash('BAD', errors_detail , '/admin/profile/');
		  }
	  })
	})

router.get('/password',authentication_mdl.is_login, function (req, res) {
	   res.render('admin/my-profile-password' , { title: "Update Profile Password" ,info_one :"Manange Profile Password" , info_two :"Ecommerce Admin Template" , info_three :"Dashboard" , info_four :"Manage Profile Password" , info_five :"Profile Password Modification Form" , username : req.session.user_nickname , page_name: 'dashboard'  });
})

router.post('/updatepassword',function(req,res,next)
{
	            v_old_pass = req.sanitize( 'old_pass' ).trim(); 
				v_new_pass = req.sanitize( 'new_pass' ).trim();
				v_conf_new_pass = req.sanitize( 'conf_new_pass' ).trim();
				
				req.assert('old_pass' ,'Please Enter Your Old Password').notEmpty();
		        req.assert('new_pass' ,'Please Enter Your New Password').notEmpty();
		        req.assert('conf_new_pass' ,'Please Enter Your Confirm  Password').notEmpty();
				
				var errors = req.validationErrors();
				req.getConnection(function(err,connection)
				{
						if(!errors)
						{
							
							var query =  connection.query('SELECT * FROM tbl_admin_users where id='+req.session.userid,function(err,rows){
								
								if(err)
								{
									var errors_detail  = ("Error Update : %s ",err ); 
									 req.flash('BAD', errors_detail , '/admin/password/');
								}
								else
								{
									//var encryptedpassword = md5(v_old_pass);
									var old_pass = md5(v_old_pass);
									var password = rows[0].password;
									if(old_pass==password)
									{
										
										if(v_new_pass==v_conf_new_pass)
										{
											   var adminpassword = {
																		password: md5(v_conf_new_pass),
																	    fresh_password: v_conf_new_pass
																  };
											   var update_admin_password ='update tbl_admin_users set ? where id='+req.session.userid;
											   
											   var query =  connection.query(update_admin_password,adminpassword,function(err,rows)
														{
															if(err)
															{
																var errors_detail  = ("Error Update : %s ",err ); 
																 req.flash('BAD', errors_detail , '/admin/password/');
															}
															else
															{
																var sucess_detail = 'Profile Password Update Sucessfully ';
																 req.flash('GOOD', sucess_detail , '/admin/password/');
															}	
													
														});
											   											   
											
											
										}
										else
										{
											var failure = "New Password Not matched with confirm Password!!!"
										    req.flash('BAD', failure , '/admin/password/');
										}	
										
										
									}
									else
									{
										var failure = "Old Password Not Match !!!"
										req.flash('BAD', failure , '/admin/password/');
									}	
									 
								}	
								
								
							})
							
						}
						else
						{
							errors_detail = "<p>Sory there are error</p><ul>";
							  for (i in errors) 
							  { 
								 error = errors[i]; 
								 errors_detail +='<li>'+error.msg+'</li>';  
							  } 
							  errors_detail += "</ul>";
							  console.log(errors_detail);
							  req.flash('BAD', errors_detail , '/admin/password/');
						}	
				})	
				
				
})


router.get('/profile-pics',authentication_mdl.is_login, function (req, res) {
   res.render('admin/my-profile-pics' , { title: "Update Profile Picture"  ,info_one :"Manange Profile Picture" , info_two :"Ecommerce Admin Template" , info_three :"Dashboard" , info_four :"Manage Profile Picture" , info_five :"Profile Picture Modification Form" , username : req.session.user_nickname ,page_name: 'dashboard' });
});


var storage =   multer.diskStorage({  
  destination: function (req, file, callback) {  
    callback(null, './uploads/profile');  
  },  
  filename: function (req, file, callback) {  
    callback(null,  file.fieldname + '-' + Date.now());  
  }  
});  



var upload = multer({ storage : storage}).single('displayImage');  
router.post('/updateprofileimage',authentication_mdl.is_login, function (req, res) {
	

    upload(req,res,function(err)
     {  
        if(err)
         {  
           // return res.end("Error uploading file.");  
             
              var failure = err;
	 		 req.flash('BAD', failure , '/admin/profile-pics/');

         } 
         else
         {

            			  if(req.file !==  undefined){
              										    var filename =  req.file.originalname ;
            			  							    var extension =	filename.split('.').pop();
            			  							    var file_name = req.file.filename+'.'+extension
	            			  							//console.log(extension);	
	              										//console.log(req.file.originalname);
	              										//console.log(req.file.filename);

	              										//console.log(req.file);

              										    var adminprofile = {
																			 admin_pis: file_name
																		   };
			   											var update_admin_profile ='update tbl_admin_users set ? where id='+req.session.userid;
										         		req.getConnection(function(err,connection)
														{
																var query =  connection.query(update_admin_profile,adminprofile,function(err,rows)
																	{
																		if(err)
																		{
																			var errors_detail  = ("Error Update : %s ",err ); 
																			 req.flash('BAD', errors_detail , '/admin/profile-pics/');
																		}
																		else
																		{
																			var sucess_detail = 'Profile pics Update Sucessfully ';
		 																	req.flash('GOOD', sucess_detail , '/admin/profile-pics/');
																		}	
																
																	});
														});	

       												
              										
										}


         } 
       // res.end("File is uploaded successfully!");  

       // 
    });  


    
});


/* profile information   updatation end */

module.exports = router