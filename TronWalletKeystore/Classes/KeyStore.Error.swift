
import Foundation

extension KeyStore {
    public enum Error: Swift.Error, LocalizedError {
        case accountAlreadyExists
        case accountNotFound
        case invalidMnemonic

        public var errorDescription: String? {
            switch self {
            case .accountAlreadyExists:
                return NSLocalizedString("Account already exists", comment: "Error message when trying to add an account that already exists")
            case .accountNotFound:
                return NSLocalizedString("Account not found", comment: "Error message when trying to access an account that does not exist")
            case .invalidMnemonic:
                return NSLocalizedString("Invalid mnemonic phrase", comment: "Error message when trying to import an invalid mnemonic phrase")
            }
        }
    }
}
