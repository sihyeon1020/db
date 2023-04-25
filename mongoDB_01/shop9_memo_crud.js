db.getCollection("memo").find({})

db.memo.find({name: "Tom", office : "Seoul"},{phone : 1}).count() //and 조건

db.memo.find({$or : [{name: "Tom"}, {office : "Seoul"}]},{phone : 1}).count() //or 조건
//{$or : [{조건키 : 값},{조건키 : 값}]} ==> {$or :[json, json, json]}

db.memo.find({office:"Busan"}, {_id : 0 , office : 1, phone : 1 })

db.memo.find({office:{$not:/Busan/}}, {_id : 0 , office : 1, phone : 1 }).limit(3)

db.memo.deleteOne({office : "Wordware"})

db.memo.find({office : "Wordware"})

db.memo.updateMany({office:"Seoul"},{$set : {phone:"999"}})

db.memo.find({office:"Seoul"},{phone:1, _id:0})

db.memo.deleteMany({})

db.memo.find({}).count()