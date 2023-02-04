

import UIKit

class WaveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = view.bounds.size.width
        
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width:900, height: 100))
        imageView1.image = UIImage(named: "animationImg")
        imageView1.clipsToBounds = true
        
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width:900, height: 100))
        imageView2.image = UIImage(named: "animationImg2")
        imageView2.clipsToBounds = true
        
        
        view.addSubview(imageView1)
        view.addSubview(imageView2)
        view.bringSubviewToFront(imageView1)
        
        
        UIView.animate(withDuration: 30.0, delay: 0,options: [.repeat], animations: {
            imageView1.frame.origin.x = -440
            //imageView1.frame.origin.x = 150
        }, completion: nil)
        
        UIView.animate(withDuration: 34.0, delay: 1,options: [.repeat], animations: {
            imageView2.frame.origin.x = -300
            //imageView1.frame.origin.x = 150
        }, completion: nil)
    }
    


}
