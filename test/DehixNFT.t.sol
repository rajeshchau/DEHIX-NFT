// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/DehixNFT.sol";

contract ProfessionalCertificateNFTTest is Test {
    ProfessionalCertificateNFT certificateNFT;

    // Test accounts
    address owner = address(this);
    address recipient1 = address(0x1);
    address recipient2 = address(0x2);
    address unauthorized = address(0x3);

    // Sample certificate data
    string name = "John Doe";
    string issueDate = "2025-03-15";
    string expiryDate = "2026-03-15";
    string certificationField = "Blockchain Development";
    string issuerName = "Blockchain Academy";
    string metadataURI = "ipfs://QmXyZ123456789abcdef/metadata.json";

    function setUp() public {
        // Deploy the contract
        certificateNFT = new ProfessionalCertificateNFT();

        // Set up test accounts with ETH
        vm.deal(recipient1, 1 ether);
        vm.deal(recipient2, 1 ether);
        vm.deal(unauthorized, 1 ether);
        vm.deal(address(this), 10 ether);
    }

    function testDeployment() public view {
        assertEq(certificateNFT.name(), "ProfessionalCertificateNFT");
        assertEq(certificateNFT.symbol(), "PCNFT");
        assertEq(certificateNFT.owner(), owner);
    }

    function testCreateCertificate() public {
        uint256 tokenId = certificateNFT.createCertificate(
            recipient1, name, issueDate, expiryDate, certificationField, issuerName, metadataURI
        );

        assertEq(tokenId, 0);
        assertEq(certificateNFT.balanceOf(recipient1), 1);
        assertEq(certificateNFT.ownerOf(0), recipient1);
        assertEq(certificateNFT.tokenURI(0), metadataURI);

        // Check certificate details
        ProfessionalCertificateNFT.Certificate memory cert = certificateNFT.getCertificateDetails(0);
        assertEq(cert.name, name);
        assertEq(cert.issueDate, issueDate);
        assertEq(cert.expiryDate, expiryDate);
        assertEq(cert.certificationField, certificationField);
        assertEq(cert.issuerName, issuerName);
        assertTrue(cert.isVerified);

        // Check verification status
        assertTrue(certificateNFT.isVerified(0));
        assertTrue(certificateNFT.isValidCertificate(0));
    }

    function testMultipleCertificates() public {
        // Create first certificate
        uint256 tokenId1 = certificateNFT.createCertificate(
            recipient1, name, issueDate, expiryDate, certificationField, issuerName, metadataURI
        );

        // Create second certificate with different data
        string memory name2 = "Jane Smith";
        string memory certField2 = "Smart Contract Security";
        string memory metadataURI2 = "ipfs://QmABC123456789defghi/metadata.json";

        uint256 tokenId2 = certificateNFT.createCertificate(
            recipient2, name2, issueDate, expiryDate, certField2, issuerName, metadataURI2
        );

        assertEq(tokenId1, 0);
        assertEq(tokenId2, 1);

        assertEq(certificateNFT.balanceOf(recipient1), 1);
        assertEq(certificateNFT.balanceOf(recipient2), 1);

        ProfessionalCertificateNFT.Certificate memory cert1 = certificateNFT.getCertificateDetails(0);
        ProfessionalCertificateNFT.Certificate memory cert2 = certificateNFT.getCertificateDetails(1);

        assertEq(cert1.name, name);
        assertEq(cert2.name, name2);
        assertEq(cert1.certificationField, certificationField);
        assertEq(cert2.certificationField, certField2);
    }

    function testVerifyCertificate() public {
        // Create a certificate
        uint256 tokenId = certificateNFT.createCertificate(
            recipient1, name, issueDate, expiryDate, certificationField, issuerName, metadataURI
        );

        // Initially verified
        assertTrue(certificateNFT.isVerified(tokenId));

        // Unverify the certificate
        certificateNFT.verifyCertificate(tokenId, false);
        assertFalse(certificateNFT.isVerified(tokenId));

        // Verify it again
        certificateNFT.verifyCertificate(tokenId, true);
        assertTrue(certificateNFT.isVerified(tokenId));
    }

    function testRevokeCertificate() public {
        // Create a certificate
        uint256 tokenId = certificateNFT.createCertificate(
            recipient1, name, issueDate, expiryDate, certificationField, issuerName, metadataURI
        );

        // Initially verified
        assertTrue(certificateNFT.isVerified(tokenId));

        // Revoke the certificate
        certificateNFT.revokeCertificate(tokenId);
        assertFalse(certificateNFT.isVerified(tokenId));
        assertFalse(certificateNFT.isValidCertificate(tokenId));
    }

    function testGetCertificatesByOwner() public {
        // Create two certificates for recipient1
        certificateNFT.createCertificate(
            recipient1, name, issueDate, expiryDate, certificationField, issuerName, metadataURI
        );

        certificateNFT.createCertificate(
            recipient1,
            "John Doe Jr",
            issueDate,
            expiryDate,
            "DeFi Development",
            issuerName,
            "ipfs://QmNew123456789/metadata.json"
        );

        // Create one certificate for recipient2
        certificateNFT.createCertificate(
            recipient2,
            "Jane Smith",
            issueDate,
            expiryDate,
            "Smart Contract Security",
            issuerName,
            "ipfs://QmABC123456789defghi/metadata.json"
        );

        // Get certificates by owner
        uint256[] memory recipient1Certs = certificateNFT.getCertificatesByOwner(recipient1);
        uint256[] memory recipient2Certs = certificateNFT.getCertificatesByOwner(recipient2);

        // Check correct number of certificates
        assertEq(recipient1Certs.length, 2);
        assertEq(recipient2Certs.length, 1);

        // Check certificate IDs
        assertEq(recipient1Certs[0], 0);
        assertEq(recipient1Certs[1], 1);
        assertEq(recipient2Certs[0], 2);
    }

    function testOnlyOwnerCanCreateCertificates() public {
        // Try to create certificate as unauthorized user
        vm.prank(unauthorized);

        // Updated expectation to match the actual error message format
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, unauthorized));
        certificateNFT.createCertificate(
            recipient1, name, issueDate, expiryDate, certificationField, issuerName, metadataURI
        );
    }

    function testOnlyOwnerCanVerifyCertificates() public {
        // Create a certificate
        uint256 tokenId = certificateNFT.createCertificate(
            recipient1, name, issueDate, expiryDate, certificationField, issuerName, metadataURI
        );

        // Try to verify as unauthorized user
        vm.prank(unauthorized);

        // Updated expectation to match the actual error message format
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, unauthorized));
        certificateNFT.verifyCertificate(tokenId, false);
    }

    function testOnlyOwnerCanRevokeCertificates() public {
        // Create a certificate
        uint256 tokenId = certificateNFT.createCertificate(
            recipient1, name, issueDate, expiryDate, certificationField, issuerName, metadataURI
        );

        // Try to revoke as unauthorized user
        vm.prank(unauthorized);

        // Updated expectation to match the actual error message format
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, unauthorized));
        certificateNFT.revokeCertificate(tokenId);
    }

    function testCannotVerifyNonexistentCertificate() public {
        vm.expectRevert("Certificate does not exist");
        certificateNFT.verifyCertificate(999, true);
    }

    function testCannotRevokeNonexistentCertificate() public {
        vm.expectRevert("Certificate does not exist");
        certificateNFT.revokeCertificate(999);
    }

    function testCannotRevokeAlreadyRevokedCertificate() public {
        // Create a certificate
        uint256 tokenId = certificateNFT.createCertificate(
            recipient1, name, issueDate, expiryDate, certificationField, issuerName, metadataURI
        );

        // Revoke once
        certificateNFT.revokeCertificate(tokenId);

        // Try to revoke again
        vm.expectRevert("Certificate already revoked");
        certificateNFT.revokeCertificate(tokenId);
    }

    // function testWithdraw() public {
    //     // Make contract payable in Foundry
    //     certificateNFT = ProfessionalCertificateNFT(payable(address(certificateNFT)));

    //     // Send ETH directly to the contract address
    //     payable(address(certificateNFT)).transfer(1 ether);

    //     assertEq(address(certificateNFT).balance, 1 ether);

    //     uint256 initialBalance = address(this).balance;

    //     // Withdraw funds
    //     certificateNFT.withdraw();

    //     // Check balance increased
    //     assertEq(address(this).balance, initialBalance + 1 ether);
    //     assertEq(address(certificateNFT).balance, 0);
    // }

    // function testOnlyOwnerCanWithdraw() public {
    //     // Make contract payable in Foundry
    //     certificateNFT = ProfessionalCertificateNFT(payable(address(certificateNFT)));

    //     // Send ETH directly to the contract address
    //     payable(address(certificateNFT)).transfer(1 ether);

    //     assertEq(address(certificateNFT).balance, 1 ether);

    //     // Try to withdraw as unauthorized user
    //     vm.prank(unauthorized);

    //     // Updated expectation to match the actual error message format
    //     vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, unauthorized));
    //     certificateNFT.withdraw();
    // }

    function testCannotWithdrawZeroBalance() public {
        vm.expectRevert("No funds to withdraw");
        certificateNFT.withdraw();
    }

    // Needed to receive ETH in the test contract
    receive() external payable {}
}
