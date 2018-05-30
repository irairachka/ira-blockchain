module.exports = {
    networks: {
        development: {
            host: '127.0.0.1',
            //host: '51.144.177.48',
            //host: 'ec2-52-59-221-203.eu-central-1.compute.amazonaws.com' ,
            port: 22000,
            network_id: '*',// Match any network id
            gas: 57000000,
            gasPrice: 0
        }
    }
};
