db.getCollection("memo").find({})

//확인문제
//1.office: Wordware인 사람의 age, phone검색
db.memo.find({office:"Wordware"},{age:1, phone:1})

//2.age:1인 사람의 office, name검색한후, 갯수확인(count)
db.memo.find({age:1},{office:1, name:1}).count()

//3.age: 200, name:hong, office:busan, phone:011 추가
db.memo.insertOne({age:200, name:"hong", office:"Busan", phone:"011"})

//4.전체검색
db.memo.find({})

//5.age가 2인 사람의 office를 seoul로 수정(1개의 document)
db.memo.updateOne({age:2},{$set:{office:"Seoul"}})

//6.age가 2이거나 office가 busan인 사람의 전체 목록 프린트
db.memo.find({$or:[{age:2},{office:"Busan"}]})

//7.age가 3인 사람의 document를 삭제후, age가 3인 사람을 검색
db.memo.deleteOne({age:3})
db.memo.find({age:3})

//8.name이 Didi인 사람의 office를 ulsan으로 변경, name이 Didi인 사람 검색
db.memo.updateMany({name:"Didi"},{$set : {office:"Ulsan"}})
db.memo.find({name:"Didi"})

//9.memo에 있는 사람 전체 삭제
db.memo.deleteMany({})

//10.memo collection삭제후 전체 collections목록 프린트
db.memo.drop()
show collections