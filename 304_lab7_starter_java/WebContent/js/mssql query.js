const sql = require('mssql')

const { PassThrough } = require('stream')

const config = {
    user: 'SA',
    password: 'YourStrong@Passw0rd',
    server: 'localhost',
    database: 'brainYard',
    options: {
        enableArithAbort: true,
        trustServerCertificate: true
    }
}


const run = async () => {
    try {
        console.log('Connection Opening...');
        // const pool = await sql.connect(config);
        await sql.connect(config);
        const result = await sql.query`select * from BUser;`;
        console.dir(result);
    } catch (err) {
        console.log(err);
    } finally {
        console.log('Connection closed');
    }

}

run();