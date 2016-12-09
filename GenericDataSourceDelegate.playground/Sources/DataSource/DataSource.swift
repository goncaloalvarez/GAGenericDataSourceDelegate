import Foundation

public struct DataSource: GenericDataSource {

    var delegate: AnyDataSourceDelegate<Model, DataSource>
    
    func request(modelWithId modelId: Int) {
        
        //Handle all network calls (asynch promise related code)
        
        if (true) {
        
            self.delegate.didFind(results: .success(Model(identifier: 0, name: "name")), in: self)
            
        } else {
        
            self.delegate.didFind(results: .failure(NSError()), in: self)
        }
    }
}
