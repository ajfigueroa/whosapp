import WebKit

class WhatsappWebViewController: UIViewController {
    // MARK: - Views
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.customUserAgent = Constants.safariUserAgent
        return webView
    }()
    private let activityIndicatorView = UIActivityIndicatorView(style: .gray)

    // MARK; - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        view.addSubview(webView)
        view.addSubview(activityIndicatorView)
        loadWhatsAppDesktopPage()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds

        var frame: CGRect = CGRect(x: 0, y: 0, width: 44, height: 44)
        frame.origin.x = (view.bounds.width - frame.width) / 2
        frame.origin.y = (view.bounds.height - frame.height) / 2
        activityIndicatorView.frame = frame
    }

    // MARK: - Request Loading
    private func loadWhatsAppDesktopPage() {
        guard let url = URL(string: Constants.whatsappUrl) else {
            fatalError("Failed to create valid url")
        }

        let request = URLRequest(url: url)
        webView.load(request)
        activityIndicatorView.startAnimating()
    }
}

// MARK: - WKNavigationDelegate
extension WhatsappWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        let nsError = error as NSError
        guard nsError.code == NSURLErrorNotConnectedToInternet else {
            return
        }

        webView.loadHTMLString(Constants.offlineHtmlString, baseURL: nil)
    }
}
