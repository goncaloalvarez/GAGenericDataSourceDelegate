import Foundation
import UIKit

public class AnotherViewController: UIViewController {
    
    fileprivate var dataSource: AnotherDataSource?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.dataSource = AnotherDataSource(delegate: AnyDataSourceDelegate<(Model,AnotherModel)>(self))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.dataSource = AnotherDataSource(delegate: AnyDataSourceDelegate<(Model,AnotherModel)>(self))
    }
    
    public func triggerRequest() {
        
        self.dataSource?.request()
    }
}

extension AnotherViewController: GenericDataSourceDelegate {
    
    func didFind(results: Results<(Model,AnotherModel)>) {
        
        if case let Results.success(model) = results {
            
            print("Here's another model: \(model)")
        }
    }
}
