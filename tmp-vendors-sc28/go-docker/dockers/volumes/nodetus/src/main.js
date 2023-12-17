const { Server } = require('@tus/server')
const { FileStore } = require('@tus/file-store')

const host = '0.0.0.0'
const port = 3000
const server = new Server({
    path: '/files',
    datastore: new FileStore({ directory: '/data' }),
    onIncomingRequest: function (req, res) {
        return new Promise(function (resolve, reject) {
            console.log(req);
            resolve();
        });
    },
})

server.listen({ host, port })
