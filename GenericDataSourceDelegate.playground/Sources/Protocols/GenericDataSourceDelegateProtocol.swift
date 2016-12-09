import Foundation

//This allows the usage of the same protocol for every data source as long as all of them comply to GenericDataSourceProtocol 
//(no need to add specific delegate protocols for each one of them)

protocol GenericDataSourceDelegate {
    
    associatedtype ResourceType
    associatedtype DataSourceType
    
    //NSError should be replaced with Error
    func didFind(results: Results<ResourceType>, in dataSource: DataSourceType)
}

struct AnyDataSourceDelegate<U, T>: GenericDataSourceDelegate {

    let _didFind: (Results<U>, T) -> ()
    
    init<Base: GenericDataSourceDelegate>(base : Base) where Base.ResourceType == U, Base.DataSourceType == T {
        
        _didFind = base.didFind
    }
    
    func didFind(results: Results<U>, in dataSource: T) {
        
        _didFind(results, dataSource)
    }
}
