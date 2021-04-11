//
//  HorizontalSnappingCVController.swift
//  labs-ios-starter
//
//  Created by Sal562 on 3/30/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import UIKit

class HorizontalSnappingCVController: UICollectionViewController {
  
    //MARK: - Required Initializers to override classes
    init() {
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        
        //call decelerationRate after super init to change the deceleration rate
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//Horizontal Scroll Snapping
class SnappingLayout : UICollectionViewFlowLayout {
    //snapping Behavior here
    
    //Override WithScrollingVelocity
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
      guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
      let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        
        //Using magical number 48 but 
      let itemWidth = collectionView.frame.width - 48
      let itemSpace = itemWidth + minimumInteritemSpacing
      var pageNumber = round(collectionView.contentOffset.x / itemSpace)

      // Skip to the next cell, if there is residual scrolling velocity left. This helps to prevent glitches
      let vX = velocity.x
      if vX > 0 {
        pageNumber += 1
      } else if vX < 0 {
        pageNumber -= 1
      }

      let nearestPageOffset = pageNumber * itemSpace
      return CGPoint(x: nearestPageOffset,
                     y: parent.y)
    }
    
}
