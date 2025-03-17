// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title ProfessionalCertificateNFT
 * @dev Contract for creating professional certificate NFTs
 */
contract ProfessionalCertificateNFT is ERC721, ERC721URIStorage, ERC721Enumerable, Ownable {
    // Simple counter for token IDs
    uint256 private _nextTokenId;

    // Certificate data structure
    struct Certificate {
        string name;
        string issueDate;
        string expiryDate;
        string certificationField;
        string issuerName;
        bool isVerified;
    }

    // Mapping from token ID to Certificate data
    mapping(uint256 => Certificate) public certificates;
    
    // Mapping to track certificate verification status
    mapping(uint256 => bool) public verifiedCertificates;
    
    // Events
    event CertificateCreated(uint256 tokenId, address recipient, string name, string certificationField);
    event CertificateVerified(uint256 tokenId, bool verificationStatus);
    event CertificateRevoked(uint256 tokenId);

    constructor() ERC721("ProfessionalCertificateNFT", "PCNFT") Ownable(msg.sender) {
        // Initialize token ID counter
        _nextTokenId = 0;
    }

    /**
     * @dev Creates a new certificate NFT
     * @param recipient The address that will receive the certificate
     * @param name Name of the certificate holder
     * @param issueDate Date when certificate was issued
     * @param expiryDate Date when certificate expires
     * @param certificationField Field of certification
     * @param issuerName Name of the issuer
     * @param metadataURI URI containing metadata and image of the certificate
     */
    function createCertificate(
        address recipient,
        string memory name,
        string memory issueDate,
        string memory expiryDate,
        string memory certificationField,
        string memory issuerName,
        string memory metadataURI
    ) public onlyOwner returns (uint256) {
        uint256 tokenId = _nextTokenId;
        _nextTokenId++;
        
        _safeMint(recipient, tokenId);
        _setTokenURI(tokenId, metadataURI);

        certificates[tokenId] = Certificate({
            name: name,
            issueDate: issueDate,
            expiryDate: expiryDate,
            certificationField: certificationField,
            issuerName: issuerName,
            isVerified: true
        });
        
        verifiedCertificates[tokenId] = true;
        
        emit CertificateCreated(tokenId, recipient, name, certificationField);
        
        return tokenId;
    }

    /**
     * @dev Checks if a token exists
     * @param tokenId ID of the token
     * @return bool Whether the token exists
     */
    function _certificateExists(uint256 tokenId) internal view returns (bool) {
        return _ownerOf(tokenId) != address(0);
    }

    /**
     * @dev Verifies or unverifies a certificate
     * @param tokenId ID of the certificate
     * @param status Verification status to set
     */
    function verifyCertificate(uint256 tokenId, bool status) public onlyOwner {
        require(_certificateExists(tokenId), "Certificate does not exist");
        
        certificates[tokenId].isVerified = status;
        verifiedCertificates[tokenId] = status;
        
        emit CertificateVerified(tokenId, status);
    }

    /**
     * @dev Revokes a certificate
     * @param tokenId ID of the certificate to revoke
     */
    function revokeCertificate(uint256 tokenId) public onlyOwner {
        require(_certificateExists(tokenId), "Certificate does not exist");
        require(verifiedCertificates[tokenId], "Certificate already revoked");
        
        certificates[tokenId].isVerified = false;
        verifiedCertificates[tokenId] = false;
        
        emit CertificateRevoked(tokenId);
    }

    /**
     * @dev Returns all certificates owned by an address
     * @param owner Address to query
     * @return Array of token IDs
     */
    function getCertificatesByOwner(address owner) public view returns (uint256[] memory) {
        uint256 balance = balanceOf(owner);
        uint256[] memory tokenIds = new uint256[](balance);
        
        for (uint256 i = 0; i < balance; i++) {
            tokenIds[i] = tokenOfOwnerByIndex(owner, i);
        }
        
        return tokenIds;
    }

    /**
     * @dev Returns certificate details
     * @param tokenId ID of the certificate
     * @return Certificate details
     */
    function getCertificateDetails(uint256 tokenId) public view returns (Certificate memory) {
        require(_certificateExists(tokenId), "Certificate does not exist");
        return certificates[tokenId];
    }

    /**
     * @dev Returns verification status of a certificate
     * @param tokenId ID of the certificate
     * @return bool Verification status
     */
    function isVerified(uint256 tokenId) public view returns (bool) {
        require(_certificateExists(tokenId), "Certificate does not exist");
        return verifiedCertificates[tokenId];
    }

    /**
     * @dev Checks if a certificate is valid (not expired and verified)
     * @param tokenId ID of the certificate
     * @return bool Validity status
     */
    function isValidCertificate(uint256 tokenId) public view returns (bool) {
        require(_certificateExists(tokenId), "Certificate does not exist");
        // In a real implementation, you'd need to parse and compare dates
        // This is a simplified check
        return verifiedCertificates[tokenId];
    }

    /**
     * @dev Allows owner to withdraw any ETH sent to the contract
     */
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        (bool success, ) = payable(owner()).call{value: balance}("");
        require(success, "Transfer failed");
    }

    // The following functions are overrides required by Solidity

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}