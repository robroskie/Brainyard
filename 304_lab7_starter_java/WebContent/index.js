const sql = require('mssql');
const { PassThrough } = require('stream');

const config = {
  user: 'sa',
  password: 'YourStrong@Passw0rd',
  server: 'localhost',
  database: 'tempdb',
  options: {
    enableArithAbort: true,
  },
};

const run = async () => {
  try {
    console.log('Connection Opening...');
    const pool = await sql.connect(config);
    const { recordset } = await sql.query`select * from users;`;

    console.log(recordset);
  } catch (err) {
    console.log(err);
  } finally {
    await pool.close();
    console.log('Connection closed');
  }
};

run();
