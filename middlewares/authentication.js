<<<<<<< HEAD
var Auth = 
{ 
	is_login: function (req, res, next) 
	{ 
		if (!req.session.is_login) 
		{ 
			return res.redirect('/admin/'); 
		} 
		next(); 
	},
	
}; 
=======
var Auth = 
{ 
	is_login: function (req, res, next) 
	{ 
		if (!req.session.is_login) 
		{ 
			return res.redirect('/admin/'); 
		} 
		next(); 
	},
	
}; 
>>>>>>> 19e170ff9077989697cca98323f6ac5fda057642
module.exports = Auth;