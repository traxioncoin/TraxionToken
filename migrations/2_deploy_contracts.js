const TraxionToken = artifacts.require("./TraxionToken.sol");

module.exports = function (deployer) {
    deployer.deploy(TraxionToken.sol);
};
