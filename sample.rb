require 'selenium-webdriver'
BaseURL = "https://www.google.co.jp"

caps = Selenium::WebDriver::Remote::Capabilities.chrome(
  "chromeOptions" => { "args" => ["download.prompt_for_download=true"] }
)

driver = Selenium::WebDriver.for(:remote,
    url: "http://hub:4444/wd/hub",
    desired_capabilities: caps)
driver.get(BaseURL)

#検索する
driver.find_element(:name, "q").send_keys("ネコ")

#要素をクリックする
driver.find_element(:class, "q qs").click

#スクリーンショットをとる
driver.save_screenshot("./save_screenshot.jpg")

driver.get("https://chromedriver.storage.googleapis.com/index.html?path=2.33/")

#ダウンロードプロンプトをスルーしてダウンロードする
driver.find_element(:xpath, "/html/body/table/tbody/tr[5]/td[2]/a").click
