import Foundation

public struct DataSource: GenericDataSource {

    var delegate: AnyDataSourceDelegate<Model>
    
    func request() {
        
        //Handle all network calls (asynch promise related code)
        
        if (true) {
            
            self.delegate.didFind(results: .success(Model(identifier: 0, name: "name")))
            
        } else {
        
            self.delegate.didFind(results: .failure(NSError()))
        }
    }
}
