var sentence = {
    insertAccount: 'INSERT INTO account(id,userName,permissions,password) VALUES(?,?,?,?)',
    login: 'SELECT * FROM account WHERE userName = ? and password = ? ',
    getAccountByUserName:'SELECT * FROM account WHERE userName = ? ',
    getAccountByUserId:'SELECT * FROM account WHERE id = ? ',
    insertCommunity: 'INSERT INTO community(communityID,communityTime,communityUserID,communityUseYear,communityUseMonth,communityUseDay,communityUseHour,note) VALUES ?',
    getCommunity: 'SELECT * FROM community',
    getCommunityByTime: 'SELECT * FROM community WHERE communityUseYear = ? and communityUseMonth = ? and communityUseDay = ? and communityUseHour = ?',
    getCommunityByid: 'SELECT * FROM community WHERE communityID = ? and communityUserID = ?',
    getCommunityListByid: 'SELECT * FROM community WHERE communityUserID = ?',
    deleteCommunityByid: 'delete from community where communityID= ? and communityUserID = ?',
    queryAll:'SELECT * FROM User',
}

module.exports = sentence;
