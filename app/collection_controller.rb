class CollectionViewController < UICollectionViewController

 
  CELL_IDENTIFIER = "Cell Identifier"
  CELL_HEADER = "header"
  CELL_FOOTER = "footer"
  attr_accessor :use_headers, :use_footers, :number_of_sections, :items_in_section


  def viewWillAppear(animated)
    super
    collectionView.subviews.each do |sv|
      sv.alpha = 0.2
    end
  end



  #Flow Layout

  def collectionView(collectionView, layout: collectionViewLayout, referenceSizeForHeaderInSection:section)
    return use_headers ? CGSizeMake(60,30) : CGSizeZero;
  end

  def collectionView(collectionView, layout:collectionViewLayout, referenceSizeForFooterInSection:section)
    return use_footers ? CGSizeMake(60,30) : CGSizeZero;
  end

  def numberOfSectionsInCollectionView(collectionView)
    return number_of_sections
  end

  def collectionView(collectionView, numberOfItemsInSection:section)
    return items_in_section
  end

  def collectionView(collectionView, cellForItemAtIndexPath:indexPath)
    cell = collectionView.dequeueReusableCellWithReuseIdentifier(CELL_IDENTIFIER, forIndexPath:indexPath)
    
    cell.backgroundColor = UIColor.whiteColor
    cell.selectedBackgroundView = UIView.alloc.initWithFrame(CGRectZero)
    cell.selectedBackgroundView.backgroundColor = UIColor.systemGreenColor.colorWithAlphaComponent(0.5)
    return cell
  end

  # If using headers and footers, dequeue and prepare a view
  def collectionView(collectionView, viewForSupplementaryElementOfKind:kind, atIndexPath:indexPath)
    if kind === UICollectionElementKindSectionHeader
      @header = self.collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier:CELL_HEADER, forIndexPath:indexPath)
      @header.backgroundColor = UIColor.blackColor
      return @header
    elsif kind == UICollectionElementKindSectionFooter
      @footer = self.collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier:CELL_FOOTER, forIndexPath:indexPath)
      @footer.backgroundColor = UIColor.darkGrayColor
      return @footer
    end
    return nil
  end

  def collectionView(collectionView, didSelectItemAtIndexPath:indexPath)
    NSLog("Selected %@", indexPath)
  end

  def collectionView(collectionView, didDeselectItemAtIndexPath:indexPath)
    NSLog("Deselected %@", indexPath)
  end

  def viewDidLoad
    super
  
    # Original from The Core iOS Developer's Cookbook
    #self.collectionView.registerClass(UICollectionViewCell, forCellWithReuseIdentifier:CELL_IDENTIFIER)

    # Use custom ImageCell class from models directory.
    self.collectionView.registerClass(ImageCell, forCellWithReuseIdentifier:CELL_IDENTIFIER)
    self.collectionView.registerClass(UICollectionReusableView, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier:CELL_HEADER)
    self.collectionView.registerClass(UICollectionReusableView, forSupplementaryViewOfKind:UICollectionElementKindSectionFooter, withReuseIdentifier:CELL_FOOTER)
    
    self.collectionView.backgroundColor = UIColor.whiteColor

    self.collectionView.allowsMultipleSelection = true
  end

  def initWithCollectionViewLayout(layout)
    if super
      self.use_footers = false
      self.use_headers = false
      self.number_of_sections = 1
      self.items_in_section = 1
    end
    self
  end
end
