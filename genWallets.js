const ethWallet = require('ethereumjs-wallet');
for(let index=0; index < 10; index++) {
    let addressData = ethWallet['default'].generate();
    console.log(`Private key = , ${addressData.getPrivateKeyString()}`);
    console.log(`Address = , ${addressData.getAddressString()}`);
}