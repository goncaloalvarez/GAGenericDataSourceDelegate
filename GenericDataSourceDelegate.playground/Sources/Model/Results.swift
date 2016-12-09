import Foundation

enum Results<T> {
    
    case success(T)
    case failure(Error)
}
