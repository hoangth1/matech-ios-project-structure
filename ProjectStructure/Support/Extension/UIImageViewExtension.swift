//
//  UIImageViewExtension.swift
//  SecretPhoto
//
//  Created by M1 on 6/5/21.
//

import Foundation
import UIKit
import SDWebImage
import Photos

extension UIImageView {
    func setImage(with url: URL?, completion: (() -> Void)? = nil) {
        self.sd_setImage(with: url, placeholderImage: nil, options: .refreshCached) { (_, _, _, _) in
            completion?()
        }
    }
    
    func setResizeImage(with url: URL?, completion: (() -> Void)? = nil) {
        let transformer = SDImageResizingTransformer(size: CGSize(width: 150, height: 150), scaleMode: .aspectFill)
        self.sd_setImage(with: url , placeholderImage: nil, context: [.imageTransformer: transformer])
    }
    
}

extension UIImageView{
    
    func fetchImageAsset(_ asset: PHAsset?, targetSize size: CGSize, contentMode: PHImageContentMode = .aspectFill, options: PHImageRequestOptions? = nil, completionHandler: ((Bool) -> Void)? = nil) {
      // 1
      guard let asset = asset else {
        completionHandler?(false)
        return
      }
      // 2
      let resultHandler: (UIImage?, [AnyHashable: Any]?) -> Void = { image, info in
        self.image = image
        completionHandler?(true)
      }
      // 3
      PHImageManager.default().requestImage(
        for: asset,
        targetSize: size,
        contentMode: contentMode,
        options: options,
        resultHandler: resultHandler)
    }
    
    func makeRounded() {
           self.layer.masksToBounds = false
           self.layer.cornerRadius = self.frame.height / 2
           self.clipsToBounds = true
       }
    
    func g_loadImage(_ asset: PHAsset) {
      guard frame.size != CGSize.zero else {
        return
      }

      if tag == 0 {
      } else {
        PHImageManager.default().cancelImageRequest(PHImageRequestID(tag))
      }

      let options = PHImageRequestOptions()
      options.isNetworkAccessAllowed = true

      let scale = UIScreen.main.scale
      let size = CGSize(width: frame.width * scale, height: frame.height * scale)

      let id = PHImageManager.default().requestImage(
        for: asset,
        targetSize: size,
        contentMode: .aspectFill,
        options: options) { [weak self] image, _ in
        self?.image = image
      }
      
      tag = Int(id)
    }
}

