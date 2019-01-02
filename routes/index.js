var express = require('express');
var router = express.Router();


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/hayashi', function(req, res, next) {
  res.render('index', { title: 'hayashi', label: '123321' });
});

module.exports = router;
