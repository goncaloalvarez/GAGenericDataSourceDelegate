import Foundation

public struct AnotherDataSource: GenericDataSource {
    
    var delegate: AnyDataSourceDelegate<(Model,AnotherModel)>
    
    func request() {
        
        //Handle all network calls (asynch promise related code)
        
        if (true) {
            
            self.delegate.didFind(results: .success((Model(identifier: 0, name: "name"), AnotherModel(identifier: 1, anotherName: "anotherName"))))
            
        } else {
            
            self.delegate.didFind(results: .failure(NSError()))
        }
    }
}
