//
//  editPhotoViewController.swift
//  PhotoEditor
//
//  Created by Yang Nina on 2021/4/23.
//
//171 154 147buttoncolor
//9BAB9A 墨綠色
//AB9A93 咖啡色

import UIKit

struct FilterSetting{
    var pic: UIImage? = UIImage()
}

var currentColorControlMode = kCIInputBrightnessKey

class editPhotoViewController: UIViewController, UIColorPickerViewControllerDelegate {

    @IBOutlet weak var showphotoImg: UIImageView!
    @IBOutlet weak var bgimgView: UIView!
    @IBOutlet var fullView: UIView!
    //功能選單
    @IBOutlet var rotateView: UIView!
    @IBOutlet var scaleView: UIView!
    @IBOutlet var lightView: UIView!
    @IBOutlet var filterView: UIView!
    @IBOutlet weak var sliderView: UIView!
    
    //功能按鈕
    @IBOutlet weak var rotateBtn: UIButton!
    @IBOutlet weak var scaleBtn: UIButton!
    @IBOutlet weak var lightBtn: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var colorBtn: UIButton!
    //強度調整
    @IBOutlet weak var strengthSlider: UISlider!
    @IBOutlet weak var brightBtn: UIButton!
    @IBOutlet weak var contrastBtn: UIButton!
    @IBOutlet weak var saturationBtn: UIButton!
    var filterNum:Int = 0
    var parameter = FilterSetting()
    
    //背景顏色設定
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        bgimgView.backgroundColor = viewController.selectedColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showphotoImg.image = parameter.pic
        rotateView.isHidden = false
        scaleView.isHidden = true
        lightView.isHidden = true
        filterView.isHidden = true
        sliderView.isHidden = true
        rotateBtn.tintColor = UIColor(red: 248/255, green: 200/255, blue: 145/255, alpha: 1)
    }
    //功能選擇
    @IBAction func purpose(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            rotateBtn.tintColor = UIColor(red: 248/255, green: 200/255, blue: 145/255, alpha: 1)
            scaleBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            lightBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            filterBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            rotateView.isHidden = false
            scaleView.isHidden = true
            lightView.isHidden = true
            filterView.isHidden = true
            sliderView.isHidden = true
        case 1:
            rotateBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            scaleBtn.tintColor = UIColor(red: 248/255, green: 200/255, blue: 145/255, alpha: 1)
            lightBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            filterBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            rotateView.isHidden = true
            scaleView.isHidden = false
            lightView.isHidden = true
            filterView.isHidden = true
            sliderView.isHidden = true
        case 2:
            rotateBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            scaleBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            lightBtn.tintColor = UIColor(red: 248/255, green: 200/255, blue: 145/255, alpha: 1)
            filterBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            rotateView.isHidden = true
            scaleView.isHidden = true
            lightView.isHidden = false
            filterView.isHidden = true
            sliderView.isHidden = false
        case 3:
            rotateBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            scaleBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            lightBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            filterBtn.tintColor = UIColor(red: 248/255, green: 200/255, blue: 145/255, alpha: 1)
            rotateView.isHidden = true
            scaleView.isHidden = true
            lightView.isHidden = true
            filterView.isHidden = false
            sliderView.isHidden = true
        case 4:
            rotateBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            scaleBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            lightBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            filterBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            rotateView.isHidden = true
            scaleView.isHidden = true
            lightView.isHidden = true
            filterView.isHidden = true
            sliderView.isHidden = true
            let controller = UIColorPickerViewController()
            controller.delegate = self
            present(controller, animated: true, completion: nil)
        default:
            break
        }
    }
    //旋轉 ＆ 鏡射
    var Num = 0
    var xNum = 1
    @IBAction func rotateIndex(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            Num -= 1
            showphotoImg.transform = CGAffineTransform(rotationAngle: (CGFloat.pi/180) * 90 * CGFloat(Num))
        case 1:
            if xNum == 1{
                xNum = -1
                showphotoImg.transform = CGAffineTransform(scaleX: CGFloat(xNum), y: 1)
            }
            else{
                xNum = 1
                showphotoImg.transform = CGAffineTransform(scaleX: CGFloat(xNum), y: 1)
            }
        case 2:
            Num += 1
            showphotoImg.transform = CGAffineTransform(rotationAngle: (CGFloat.pi/180) * 90 * CGFloat(Num))
        default:
            break
        }
    }
    //照片比例改變
    let width:Double = 327
    var height:Double = 0
    
    @IBAction func scaleIndex(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            height = width
        case 1:
            height = width / 3 * 4
        case 2:
            height = width / 9 * 16
        case 3:
            height = width * 3 / 4
        case 4:
            height = width * 9 / 16
        default:
            break
        }
        bgimgView.bounds.size = CGSize(width: width, height: height)
        showphotoImg.frame.size = bgimgView.frame.size
    }

    //強度改變
    @IBAction func changeStrength(_ sender: UISlider) {
        let ciImage = CIImage(image: parameter.pic!)
        let filter = CIFilter(name: "CIColorControls")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(sender.value, forKey: currentColorControlMode)
        
        if let output = filter?.outputImage {
            let filterImage = UIImage(ciImage: output)
            showphotoImg.image = filterImage
        }
    }
    //亮度&對比&飽和
    @IBAction func lightIndex(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            currentColorControlMode = kCIInputBrightnessKey
            strengthSlider.minimumValue = -0.5
            strengthSlider.value = 0
            strengthSlider.maximumValue = 0.5
            brightBtn.tintColor = UIColor(red: 248/255, green: 200/255, blue: 145/255, alpha: 1)
            contrastBtn.setBackgroundImage(UIImage(named: "contrast"), for: UIControl.State.normal)
            saturationBtn.setBackgroundImage(UIImage(named: "saturation"), for: UIControl.State.normal)
            
        case 1:
            currentColorControlMode = kCIInputContrastKey
            strengthSlider.minimumValue = 0
            strengthSlider.value = 1
            strengthSlider.maximumValue = 2
            brightBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            contrastBtn.setBackgroundImage(UIImage(named: "contrast2"), for: UIControl.State.normal)
            saturationBtn.setBackgroundImage(UIImage(named: "saturation"), for: UIControl.State.normal)
            
        case 2:
            currentColorControlMode = kCIInputSaturationKey
            strengthSlider.minimumValue = 0
            strengthSlider.value = 1
            strengthSlider.maximumValue = 2
            brightBtn.tintColor = UIColor(red: 171/255, green: 154/255, blue: 147/255, alpha: 1)
            contrastBtn.setBackgroundImage(UIImage(named: "contrast"), for: UIControl.State.normal)
            saturationBtn.setBackgroundImage(UIImage(named: "saturation2"), for: UIControl.State.normal)
        default:
            break
        }
    }
    //濾鏡選擇
    @IBAction func filterIndex(_ sender: UIButton) {
        if sender.tag == 0{
            showphotoImg.image = parameter.pic
        }
        else{
            filterNum = sender.tag
            buildImage()
        }
    }
    
    func buildImage(){
        let filter = ["", "CIPhotoEffectChrome", "CIPhotoEffectNoir", "CIPhotoEffectTonal", "CIPhotoEffectTransfer", "CIPhotoEffectFade", "CIPhotoEffectProcess", "CIPhotoEffectMono", "CIPhotoEffectInstant", "CILineOverlay", "CIBloom"]
        //如果照片不是nil
        if parameter.pic != nil{
            //產生 CIImage 物件
            let ciImage = CIImage(image: parameter.pic!)
            if let filter = CIFilter(name: filter[filterNum]){
                filter.setValue(ciImage, forKey: kCIInputImageKey)
                if let outputImage = filter.outputImage,
                   let cgImage = CIContext().createCGImage(outputImage, from: outputImage.extent){
                    let image = UIImage(cgImage: cgImage)
                    showphotoImg.image = image
                }
            }
           
        }
    }
    //儲存相片
    @IBAction func saveImg(_ sender: UIButton) {
        let renderer = UIGraphicsImageRenderer(size: bgimgView.bounds.size)
        let image = renderer.image(actions: { (context) in
            bgimgView.drawHierarchy(in: bgimgView.bounds, afterScreenUpdates: true)
        })
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
