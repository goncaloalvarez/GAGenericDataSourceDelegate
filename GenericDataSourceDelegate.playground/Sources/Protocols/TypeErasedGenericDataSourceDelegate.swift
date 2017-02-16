import Foundation

//Conforms to the generic protocol
//Defines the generic type (U) param that serves as the protocol’s associated type
//It is abstract (all functions must be overrided in the subclass)
//It will never be used directly (ergo private). It must be subclassed, to bind the generic type constraint to our protocol’s associated type.

private class _AnyDataSourceDelegateBase<U>: GenericDataSourceDelegate {
    
    init() {
        
        guard type(of: self) != _AnyDataSourceDelegateBase.self else {
            fatalError("_AnyDataSourceDelegateBase<U,T> instances can not be created; create a subclass instance instead")
        }
        
    }
    
    func didFind(results: Results<U>) {
        
        fatalError("Must override")
    }
}

// Box class

//Inherits from the abstract class
//Defines a generic type parameter “Concrete” that itself conforms to the generic protocol
//Stores an instance of “Concrete” for later usage
//Redirects each Protocol function call to the stored “Concrete”

//It is called a box, because it boxes (holds) a reference to our concrete implementer of the protocol.
//We inherit the Protocol conformance from the abstract class we are subclassing.
//We override each function by redirecting it to the Concrete classes’ implementation.
//This class is the fabric that glues the concrete class’ associated type to the abstract class’  generic type parameter

private final class _AnyDataSourceDelegateBox<ConcreteType: GenericDataSourceDelegate>: _AnyDataSourceDelegateBase<ConcreteType.ResourceType> {
    
    // variable used since we're calling mutating functions
    weak var concrete: ConcreteType?
    
    init(_ concrete: ConcreteType) {
        
        self.concrete = concrete
    }
    
    // Trampoline functions forward along to base
    override func didFind(results: Results<ConcreteType.ResourceType>) {
        
        concrete?.didFind(results: results)
    }
}

//Public wrapper

//It is a public interface for our type erased wrapper.
//Naming convention: Any
//Conforms to the generic protocol
//Defines a generic type parameter (U) that serves as the protocol’s associated type
//Takes a concrete implementer of the protocol in the initializer
//Wraps the concrete implementer in a private Box
//Redirects each protocol function call along to the Box

final class AnyDataSourceDelegate<U>: GenericDataSourceDelegate {
    
    private let box: _AnyDataSourceDelegateBase<U>
    
    // Initializer takes our concrete implementer of GenericDataSourceDelegate
    init<Concrete: GenericDataSourceDelegate>(_ concrete: Concrete) where Concrete.ResourceType == U {
        
        box = _AnyDataSourceDelegateBox(concrete)
    }
    
    func didFind(results: Results<U>) {
        
        self.box.didFind(results: results)
    }
}
