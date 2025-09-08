import UIKit
import MarkdownView

class CodeOnlySampleViewController: UIViewController {
  
  init() {
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = .systemBackground
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    var markdownView: MarkdownView?
    
  override func viewDidLoad() {
    super.viewDidLoad()

      
    let mdView = MarkdownView()
    view.addSubview(mdView)
    mdView.translatesAutoresizingMaskIntoConstraints = false
    mdView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
    mdView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    mdView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    mdView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
      mdView.onRendered = { print("height = \($1)") }
    markdownView = mdView
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "reload", style: .done, target: self, action: #selector(loadMarkdown))

      
      
      let path = Bundle.main.path(forResource: "sample1", ofType: "md")!

      let url = URL(fileURLWithPath: path)
      let markdown = try! String(contentsOf: url, encoding: String.Encoding.utf8)
        
      markdownView?.easyLoad(markdown: markdown, object: nil)
  }
    
    
    @objc func loadMarkdown() {
        let path = Bundle.main.path(forResource: "sample2", ofType: "md")!

        let url = URL(fileURLWithPath: path)
        let markdown = try! String(contentsOf: url, encoding: String.Encoding.utf8)
          
        markdownView?.easyLoad(markdown: markdown, object: nil)
    }

}
