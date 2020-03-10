var ibmdb = require('ibm_db');
 
ibmdb.open("DATABASE=elec;HOSTNAME=localhost;UID=db2inst1;PWD=elecc;PORT=50000;PROTOCOL=TCPIP", function (err,conn) {
  if (err) return console.log(err);
  
  conn.query('select * from mesa', function (err, data) {
    if (err) console.log(err);
    else return data;
 
    conn.close(function () {
      console.log('done');
    });
  });
});