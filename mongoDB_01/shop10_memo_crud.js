use shop10

db.memo.find({}) //전체검색

db.memo.count({})//document count

db.memo.insertOne({
    "name" : "apple",
    "age" : 100
})

db.memo.find({}) //전체검색

db.memo.find({"name" : "apple"})

db.memo.find({"age" : 100})

db.createCollection("member")

db.member.stats()

db.member.insertOne({
    "name" : "hong",
    "age" : 100,
    "tel" : "010"
})

db.member.find({})

db.member.insertOne({
    "name" : "hong2",
    "age" : 100,
    "tel" : "010"
})

db.member.find({})

db.createCollection("bbs")

db.bbs.insertOne({"title" : "win"})

db.bbs.find({})
db.dropDatabase()

show databases