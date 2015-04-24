class ImageCell < UICollectionViewCell

  attr_accessor :image_view


  def initWithFrame(frame)
    if super
      image_view = UIImageView.alloc.initWithFrame(CGRectInset(self.bounds, 4,4))
      image_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
      self.contentView = addSubview(image_view)
    end
    return self
  end

end