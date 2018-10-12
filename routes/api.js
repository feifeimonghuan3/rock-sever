var express = require('express');
var router = express.Router();
var connObject = require('./mysql/conn');
var sentence = require('./mysql/sentence');
var mysql = require('mysql');
var uuidv1 = require('uuid/v1');
var pool = mysql.createPool(connObject);


var result200 = {
    code: 200,
    msg: '成功',
}

var responseJSON = function(res, ret) {
    if (typeof ret === 'undefined') {
        res.json({
            code: -200,
            msg: '失败',
        });
    } else {
        res.json(ret);
    }
}

router.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
    res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By",' 3.2.1')
    if(req.method=="OPTIONS") res.send(200);/*让options请求快速返回*/
    else  next();
});


/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', { title: 'ExpressApi' });
});

router.post('/login', function(req, res, next) {
    pool.getConnection(function(err, connection) {
        var param = req.body;
        connection.query(sentence.login, [param.userName, param.password], function (err, result){
            if (result.length === 0) {
                result = {
                    code: 200,
                    msg: '账号或密码错误',
                }
                responseJSON(res, result);
                connection.release();
            } else {
                var data = {
                    userName: result[0].userName,
                    uuid: result[0].id,
                    permissions: result[0].permissions,
                }
                result = {
                    data: data,
                    code: 201,
                    msg: '登陆成功',
                }
                responseJSON(res, result);
                connection.release();
            }
        });
    });
});

router.post('/addUser', function(req, res, next) {
    pool.getConnection(function(err, connection) {
        var param = req.body;
        if (param.invite !== 'linrun+!') {
            responseJSON(res, {
                code: 200,
                msg: '邀请码错误',
            });
        }
        connection.query(sentence.getAccountByUserName, [param.userName], function (err, result){
            if (result.length !== 0) {
               result = {
                   code: 200,
                   msg: '用户已存在',
               }
                responseJSON(res, result);
                connection.release();
            } else {
                var uuid = uuidv1();
                connection.query(sentence.insertAccount, [uuid, param.userName, 1, param.password], function(err, result) {
                    if (result) {
                        result = {
                            code: 201,
                            msg: '注册成功',
                        };
                    }
                    responseJSON(res, result);
                    connection.release();
                });
            }
        });
    });
});

router.post('/addCommunity', async function(req, res, next) {
    var param = req.body;
    pool.getConnection(function(err, connection) {
        connection.query(sentence.getAccountByUserId, [param.communityUserID], function (err, result){
            console.log(result);
            if (result.length === 0) {
                result = {
                    code: 200,
                    msg: '用户不存在',
                }
                responseJSON(res, result);
                connection.release();
            } else {
                var values = []
                for (var i in param.communityUseHour) {
                    var uuid = uuidv1();
                    values.push([uuid, new Date(),param.communityUserID,param.communityUseYear, param.communityUseMonth, param.communityUseDay, param.communityUseHour[i], param.note]);
                }
                console.log(values);
                connection.query(sentence.insertCommunity, [values], function(err, result) {
                    console.log(err);
                    if (result) {
                        result = {
                            code: 201,
                            msg: '预约成功',
                        };
                    }
                    responseJSON(res, result);
                    connection.release();
                });
            }
        });
    });
});

router.post('/deleteCommunity', function(req, res, next) {
    pool.getConnection(function(err, connection) {
        var param = req.body;
        connection.query(sentence.getCommunityByid, [param.communityID, param.communityUserID], function (err, result){
            if (result.length === 0) {
                result = {
                    code: 200,
                    msg: '此次预约不存在',
                }
                responseJSON(res, result);
                connection.release();
            } else {
                connection.query(sentence.deleteCommunityByid, [param.communityID, param.communityUserID], function(err, result) {
                    if (result) {
                        result = {
                            code: 201,
                            msg: '操作成功',
                        };
                    }
                    responseJSON(res, result);
                    connection.release();
                });
            }
        });
    });
});

router.get('/getCommunity', function(req, res, next) {
    pool.getConnection(function(err, connection) {
        var param = req.query || req.params;
        connection.query(sentence.getCommunity, [], function (err, result){
            if (result.length === 0) {
                result = {
                    code: 200,
                    msg: '失败',
                }
                responseJSON(res, result);
                connection.release();
            } else {
                // communityUseHour: "21"
                // communityUseMonth: "10"
                // communityUseYear

                for (var i in result) {
                    const text = `${result[i].communityUseYear}-${result[i].communityUseMonth}-${result[i].communityUseDay}`;
                    result[i].text = text;
                }
                result = {
                    data: result,
                    code: 200,
                    msg: '成功',
                }
                responseJSON(res, result);
                connection.release();
            }
        });
    });
});

router.post('/getCommunityById', async function(req, res, next) {
    var param = req.body;
    pool.getConnection(function(err, connection) {
        connection.query(sentence.getAccountByUserId, [param.communityUserID], function (err, result){
            if (result.length === 0) {
                result = {
                    code: 200,
                    msg: '用户不存在',
                }
                responseJSON(res, result);
                connection.release();
            } else {
                connection.query(sentence.getCommunityListByid, [param.communityUserID], function(err, result) {
                    console.log(err);
                    if (result) {
                        result = {
                            code: 201,
                            msg: '成功',
                            data: result,
                        };
                    }
                    responseJSON(res, result);
                    connection.release();
                });
            }
        });
    });
});


module.exports = router;
