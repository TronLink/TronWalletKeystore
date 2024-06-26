
import TrezorCrypto
import TronCore

// Hierarchical deterministic key.
public class HDKey {
    var node: HDNode

    init(node: HDNode) {
        self.node = node
    }

    /// The key's address.
    public var address: Address {
        var addressData = Data(repeating: 0, count: 20)
        _ = addressData.withUnsafeMutableBytes { addrPtr in
            hdnode_get_ethereum_pubkeyhash(&node, addrPtr)
        }
        return Address(data: addressData)
    }

    /// Private key data.
    public var privateKey: Data {
        return Data(bytes: withUnsafeBytes(of: &node.private_key) { ptr in
            return ptr.map({ $0 })
        })
    }

    /// Public key data.
    public var publicKey: Data {
        var key = Data(repeating: 0, count: 65)
        privateKey.withUnsafeBytes { ptr in
            key.withUnsafeMutableBytes { keyPtr in
                ecdsa_get_public_key65(node.curve.pointee.params, ptr, keyPtr)
            }
        }
        return key
    }
}
