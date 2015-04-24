class AppDelegate
  attr_accessor :window
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.tintColor = UIColor.systemBlueColor

    collection_layout = UICollectionViewFlowLayout.alloc.init
    collection_view_controller =  CollectionViewController.alloc.initWithCollectionViewLayout(collection_layout)
    collection_view_controller.edgesForExtendedLayout = UIRectEdgeNone
    
    collection_layout.tap do |cl|
      cl.itemSize = CGSizeMake(50,50)
      cl.sectionInset = UIEdgeInsetsMake(10,10,50,10)
      cl.scrollDirection = UICollectionViewScrollDirectionVertical
      cl.minimumLineSpacing = 10.0
      cl.minimumInteritemSpacing = 10.0
    end
    collection_view_controller.tap do |cvc|
      cvc.number_of_sections = 1
      cvc.items_in_section = 3
      cvc.use_headers = true
      cvc.use_footers = true
    end


    nav = UINavigationController.alloc.initWithRootViewController(collection_view_controller)
    @window.rootViewController = nav    
    @window.makeKeyAndVisible


    true
  end
end
