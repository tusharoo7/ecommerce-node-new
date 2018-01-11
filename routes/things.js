<<<<<<< HEAD
var express = require('express');
var router = express.Router();

router.get('/', function(req, res){
   res.send('GET route on things.');
});

router.get('/hello', function(req, res){
   res.send('test get result.');
})
router.post('/', function(req, res){
   res.send('POST route on things.');
});

//export this router to use in our index.js
=======
var express = require('express');
var router = express.Router();

router.get('/', function(req, res){
   res.send('GET route on things.');
});

router.get('/hello', function(req, res){
   res.send('test get result.');
})
router.post('/', function(req, res){
   res.send('POST route on things.');
});

//export this router to use in our index.js
>>>>>>> 19e170ff9077989697cca98323f6ac5fda057642
module.exports = router;