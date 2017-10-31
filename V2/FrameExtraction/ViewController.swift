//
//  ViewController.swift
//  Created by Bobo on 29/12/2016.
//

import UIKit

class ViewController: UIViewController, FrameExtractorDelegate {
    
    var frameExtractor: FrameExtractor!
    var imagesCollection = [UIImage]()
    @IBOutlet var captureButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func flipButton(_ sender: UIButton) {
        frameExtractor.flipCamera()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFrameExtractor()
    }

    func initFrameExtractor() {
        frameExtractor = FrameExtractor()
        frameExtractor.delegate = self
    }

    @IBAction func stopButton(_ sender: Any) {
        if frameExtractor != nil {
            self.frameExtractor = nil
            self.captureButton.setTitle("Start", for: .normal)
        } else {
            initFrameExtractor()
            self.captureButton.setTitle("Stop", for: .normal)
        }
    }

    @IBAction func showImagesButton(_ sender: Any) {
    }

    
    func captured(image: UIImage) {
        self.imagesCollection.append(image)
        imageView.image = image
    }
    
}

