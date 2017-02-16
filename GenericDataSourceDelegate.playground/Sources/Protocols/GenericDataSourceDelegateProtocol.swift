import Foundation

//This allows the usage of the same protocol for every data source as long as all of them comply to GenericDataSourceProtocol 
//(no need to add specific delegate protocols for each one of them)

protocol GenericDataSourceDelegate: class {
    
    associatedtype ResourceType
    
    func didFind(results: Results<ResourceType>)
}
