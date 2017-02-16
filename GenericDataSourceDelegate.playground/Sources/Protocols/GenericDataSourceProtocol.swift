import Foundation

protocol GenericDataSource {
    
    associatedtype ResourceType
    
    func request()
    
    var delegate: AnyDataSourceDelegate<ResourceType> {get set}
}
