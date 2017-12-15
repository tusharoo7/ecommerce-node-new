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
router.get('/',authentication_mdl.is_login, function (req, res) {
 //res.locals.message = req.flash();
 var result;
 req.getConnection(function(err,connection)
		{
                    var query = connection.query('SELECT * FROM foodstore_cms', function(err,rows)
				{
                                    if(err)
						{
							var errornya  = ("Error Selecting : %s ",err );  
							 req.flash('BAD', errornya , '/admin/cms/');
						}
                                                else
                                                {
                                                     result = rows;
                                                     //console.log(result);
                                                     res.render('admin/list-cms', { title: "Ecommerce Content Mangement System" ,data:result , info_one :"Manange Content" , info_two :"Ecommerce Admin Template" , info_three :"Cms" , info_four :"Manage Content" , info_five :"Listing of Content" ,username : req.session.user_nickname ,page_name: 'cms' });
                                                }   
                                               // console.log("Query results(outside): " + JSON.stringify(rows));
                                });
                });
 
 
 
});


router.get('/inactive/(:id)',authentication_mdl.is_login, function(req,res,next){
    
    //console.log(req.params.id) ;
    req.getConnection(function(err,connection){
        var updatestatus = {
				status: 'A'
			   };
                           
                            var update_cms_profile ="update foodstore_cms set status='IA' where id="+req.params.id;
         		req.getConnection(function(err,connection)
				{
						var query =  connection.query(update_cms_profile,function(err,rows)
							{
                                                            //console.log(query);
								if(err)
								{
									var errors_detail  = ("Error Update : %s ",err ); 
									 req.flash('BAD', errors_detail , '/admin/cms/');
								}
								else
								{
									var sucess_detail = 'Status Update Sucessfully ';
									 req.flash('GOOD', sucess_detail , '/admin/cms/');
								}	
						
							});
				});
    })
    
    
})
router.get('/active/(:id)',authentication_mdl.is_login, function(req,res,next){
  //console.log(req.params.id) ;
    req.getConnection(function(err,connection){
        var updatestatus = {
				status: 'IA'
			   };
                           
                            var update_cms_profile ="update foodstore_cms set status='A' where id="+req.params.id;
         		req.getConnection(function(err,connection)
				{
						var query =  connection.query(update_cms_profile,function(err,rows)
							{
                                                            console.log(query);
								if(err)
								{
									var errors_detail  = ("Error Update : %s ",err ); 
									 req.flash('BAD', errors_detail , '/admin/cms/');
								}
								else
								{
									var sucess_detail = 'Status Update Sucessfully ';
									 req.flash('GOOD', sucess_detail , '/admin/cms/');
								}	
						
							});
				});
    })
    
})

router.post('/cmspreview/', function(req,res,next){
    
   // console.log(req);
       // console.log('req received');
       // console.log(req.body.preview_id);
       // console.log(req.body.text);
    //console.log(res);
    
     req.getConnection(function(err,connection){
         var preview_query = "select * from foodstore_cms  where id="+req.body.preview_id;
         
         var query =  connection.query(preview_query,function(err,rows)
							{
                                                            console.log(query);
								if(err)
								{
									var errors_detail  = ("Error Update : %s ",err ); 
                                                                        console.log(errors_detail);
									
								}
								else
								{
                                                                        res.render('admin/ajax/cms-preview' , { data:rows[0]});
								}	
						
							});
         
         
     })
    
})

router.get('/editcms/(:id)', function(req,res,next){
    //res.send(req.params.id);
    
     var preview_query = "select * from foodstore_cms  where id="+req.params.id;
         req.getConnection(function(err,connection){
         var query =  connection.query(preview_query,function(err,rows)
							{
                                                            //console.log(query);
								if(err)
								{
									var errors_detail  = ("Error Update : %s ",err ); 
                                                                        res.send(errors_detail);
								}
								else
								{
									//var sucess_detail = 'Status Update Sucessfully ';
									// req.flash('GOOD', sucess_detail , '/admin/cms/');
                                                                      //  res.send(rows[0]);
                                                                        //res.render('admin/ajax/cms-preview' , { data:rows[0]});
                                                                        
                                                                        res.render('admin/editcms', { title: "Ecommerce Content Mangement System" ,data:rows[0] , info_one :"Edit Content" , info_two :"Ecommerce Admin Template" , info_three :"Cms" , info_four :"Edit Content" , info_five :"Edit Content" ,username : req.session.user_nickname ,page_name: 'cms' });
								}	
						
							});
    
    
    });
    
    
})

router.post('/updatecms/', function(req,res,next){
    
     req.getConnection(function(err,connection){
         
        var cms_pagetitle = req.sanitize( 'cms_pagetitle' ).escape().trim(); 
	var cms_description = req.sanitize( 'cms_description' ).escape();
        var cmsid =  req.sanitize( 'cmsid' ).escape().trim();
            var updatecms = {
				cms_pagetitle: cms_pagetitle,
                                cms_description: cms_description
                            };
         
         var update_admin_profile ='update foodstore_cms  set ? where id='+cmsid;
         
         var query =  connection.query(update_admin_profile,updatecms,function(err,rows)
							{
                                                           // console.log(query);
								if(err)
								{
                                                                        var errors_detail  = ("Error Update : %s ",err ); 
									 req.flash('BAD', errors_detail , '/admin/cms/');
                                                                         
								}
								else
								{                                                                    
                                                                         var sucess_detail = 'Information Updated Sucessfully ';
									 req.flash('GOOD', sucess_detail , '/admin/cms/');
								}	
						
							});
         
         
     });
    
})





module.exports = router