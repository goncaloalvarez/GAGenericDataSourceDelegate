import Foundation

protocol GenericDataSource {
    
    associatedtype ResourceType
    associatedtype DataSourceType
    
    var delegate: AnyDataSourceDelegate<ResourceType, DataSourceType> {get set}
}
