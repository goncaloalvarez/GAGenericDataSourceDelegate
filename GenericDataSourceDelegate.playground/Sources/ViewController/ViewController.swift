import Foundation
import UIKit

public class ViewController: UIViewController {

    fileprivate var dataSource: DataSource?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
        self.dataSource = DataSource(delegate: AnyDataSourceDelegate<Model>(self))
    }
    
    required public init?(coder aDecoder: NSCoder) {
    
        super.init(coder: aDecoder)
        
        self.dataSource = DataSource(delegate: AnyDataSourceDelegate<Model>(self))
    }

    public func triggerRequest() {
    
        self.dataSource?.request()
    }
}

extension ViewController: GenericDataSourceDelegate {
  
    func didFind(results: Results<Model>) {
        
        if case let Results.success(model) = results {
            
            print("Here's your model: \(model)")
        }
    }
}
