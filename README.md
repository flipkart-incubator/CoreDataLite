# CoreDataLite

## Requirements

 - You need cocoapods installed on you mac.
  

### Cocoapods

Install pods
[http://cocoapods.org/](http://cocoapods.org/)

## Adding the pod to your project pod file

	pod 'CoreDataLite', '~> 0.0'
	
## Library Usage	

This library provides a lighweight boilerplate code for CoreData in objective-c.

The code below shows how to get instance of CoreDatabaseInterface

      
      [[CoreDataManager sharedManager] setupCoreDataWithKey:self.dbName storeKey:@"dbName" objectModelIdentifier:@"databaseIdentifier"];
        
        CoreDatabaseInterface* coreDatabaseInterface = [[CoreDataManager sharedManager] getCoreDataInterfaceForKey:@"dbName"];
        
CoreDataManager is a singleton class which holds instances of CoreDatabaseInterface in a dictionary against a key, which has to be same as database name. This ensures that two database of similar name are not created.

CoreDatabaseInterface has methods to return back 

1. NSManagedObjectContext on private queue.
2. NSPersistentStoreCoordinator 
3. NSManagedObjectModel

These methods can be used to carry out operations on CoreData. 

Other than above, the CoreDatabaseInterface also provides

1. Serial Queue
2. Concurrent Queue,
which can be used to run queries in serial or parallel.

## Contributing

We'll love contributions, please report bugs in the issue tracker, create pull request (on branch `develop`) and suggest new great features (also in the issue tracker).

## License & Credits

CoreDataLite available under the [MIT license](LICENSE), so feel free to use it in commercial and non-commercial projects.

## Author

Mudit Krishna Mathur muditkmathur@gmail.com

Prabodh Prakash prabodh.prakash@gmail.com

