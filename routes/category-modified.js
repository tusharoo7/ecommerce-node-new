var express = require('express');
var multer  = require('multer');
var mime    =   require('mime');
var imager = require('multer-imager');
var path = require('path')
var fs = require('fs');
var gm = require('gm').subClass({ imageMagick: true });;
//var imageMagick = gm.subClass({ imageMagick: true });
var session_store;
var bodyParser = require('body-parser');
var app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var expressValidator = require('express-validator');
var router = express.Router();
var http = require("http");



var authentication_mdl = require('../middlewares/authentication');
var session_store;
var server = http.createServer(express);

//export this router to use in our index.js
// define the home page route
router.get('/',authentication_mdl.is_login, function (req, res) {
 //res.locals.message = req.flash();
 var result;
 req.getConnection(function(err,connection)
		{
                    var query = connection.query('SELECT * FROM foodstore_category', function(err,rows)
				{
                                    if(err)
						{
							var errornya  = ("Error Selecting : %s ",err );
							 req.flash('BAD', errornya , '/admin/product/category');
						}
                                                else
                                                {
                                                     result = rows;
                                                     //console.log(result);
                                                     res.render('admin/list-category', { title: "Ecommerce Product Category Mangement System" ,data:result , info_one :"Manange Product Category" , info_two :"Ecommerce Admin Template" , info_three :"Product Category" , info_four :"Manage Product Category" , info_five :"Listing of Product Category" ,username : req.session.user_nickname ,page_name: 'product' });
                                                }
                                               // console.log("Query results(outside): " + JSON.stringify(rows));
                                });
                });



});




router.get('/add-category/', function(req,res,next){
    //res.send(req.params.id);
    res.render('admin/addcategory', { title: "Ecommerce Product Category Mangement System" , info_one :"Add Product Category" , info_two :"Ecommerce Admin Template" , info_three :"Product Category" , info_four :"Add Product Category" , info_five :"Add Product Category" ,username : req.session.user_nickname ,page_name: 'product' });

})





var storage	=	multer({
  destination: function (req, file, callback) {
    callback(null, './public/uploads/cat_image');
  },
  filename: function (req, file, callback) {
    callback(null,  file.fieldname + '-' + Date.now()+ path.extname(file.originalname));


  }
});

var upload = multer({ destination: function (req, file, callback) {
    callback(null, './public/uploads/cat_image');
  },
  filename: function (req, file, callback) {
    callback(null,  file.fieldname + '-' + Date.now()+ path.extname(file.originalname));


  } });

router.post('/insert_product/', upload.single('userPic'), function(req,res,next){

    console.log(req.file);
    console.log(req.body);
    if(req.file)
    {
	     console.log('Uploading file...');
	     req.checkBody('cat_name' ,'Please Enter Your Category Name').notEmpty();
	     var errors = req.validationErrors();
	     if(!errors)
            {
                var filename =  req.file.filename ;
                console.log(filename);
                 gm('./public/cat_image/'+filename)
                     .resize(100, 100)
                      .gravity("Center")
                       .extent(100, 100)
                        .quality(75)
                         .noProfile()
                          .write('./public/uploads/cat_image/thumb/'+ filename , function (err)
                           {
                               if (!err) console.log('done');
                           });
                          var catname = req.body.cat_name ;
                          var catshortdes = req.body.cat_short_des ;
                          var caturl = req.body.cat_url ;
                          var catimage = '/cat_image/'+req.file.filename ;
                          var catimagethumb = '/cat_image/thumb/'+req.file.filename ;
		                  console.log(req.body.cat_name);
		                  console.log(req.body.cat_short_des);  
		                  console.log(req.body.cat_url);

		                  var catagorydetails = {
										cat_name: catname,
										cat_url: caturl,
										cat_img: catimage,
										cat_thumb : catimagethumb ,
										cat_short_des:catshortdes
									};

                  req.getConnection(function(err,connection)
                  {
                  	var query_category_insert = 'INSERT INTO foodstore_category SET ?';
                  	var query =  connection.query(query_category_insert,catagorydetails,function(err,rows)
							{
                                                           // console.log(query);
								if(err)
								{
                                     var errors_detail  = ("Error Update : %s ",err ); 
									 req.flash('BAD', errors_detail , '/admin/product/category/add-category');
                                                                         
								}
								else
								{                                                                    
                                    var sucess_detail = 'One Category Added Sucessfully ';
									 req.flash('GOOD', sucess_detail , '/admin/product/category');
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
		      req.flash('BAD', errors_detail , '/admin/product/category/add-category');
	       }

    }
    else
    {
        console.log('undefine file fields');
        req.checkBody('cat_name' ,'Please Enter Your Category Name').notEmpty();
        var errors = req.validationErrors();
         if(!errors)
            {
                

                          var catname = req.body.cat_name ;
                          var catshortdes = req.body.cat_short_des ;
                          var caturl = req.body.cat_url ;
                          var catimage = "" ;
                          var catimagethumb = "" ;
		                  console.log(req.body.cat_name);
		                  console.log(req.body.cat_short_des);  
		                  console.log(req.body.cat_url);
		                  
                     var catagorydetails = {
										cat_name: catname,
										cat_url: caturl,
										cat_img: catimage,
										cat_thumb : catimagethumb ,
										cat_short_des:catshortdes
									};

                  req.getConnection(function(err,connection)
                  {
                  	var query_category_insert = 'INSERT INTO foodstore_category SET ?';
                  	var query =  connection.query(query_category_insert,catagorydetails,function(err,rows)
							{
                                                           // console.log(query);
								if(err)
								{
                                     var errors_detail  = ("Error Update : %s ",err ); 
									 req.flash('BAD', errors_detail , '/admin/product/category/add-category');
                                                                         
								}
								else
								{                                                                    
                                    var sucess_detail = 'One Category Added Sucessfully ';
									 req.flash('GOOD', sucess_detail , '/admin/product/category');
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
		      req.flash('BAD', errors_detail , '/admin/product/category/add-category');
	       }
    }
      

            

	
})

module.exports = router;
