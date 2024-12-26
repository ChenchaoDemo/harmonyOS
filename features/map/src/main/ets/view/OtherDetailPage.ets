import { webview } from '@kit.ArkWeb';

@Component
export struct OtherDetailPage {
  @State urlInfo: string="";
  controller: webview.WebviewController = new webview.WebviewController();
  @Consume('knowledgeMapPageStack') knowledgeMapPageStack: NavPathStack;

  aboutToAppear(): void {
    this.urlInfo = this.knowledgeMapPageStack.getParamByName('otherDetailPage')[0] as string;
  }

  build() {
    NavDestination() {
      Column() {
        Web({
          src: this.urlInfo,
          controller: this.controller
        })
          .darkMode(WebDarkMode.Auto)
          .domStorageAccess(true)
          .zoomAccess(true)
          .fileAccess(true)
          .mixedMode(MixedMode.All)
          .javaScriptAccess(true)
          .width('100%')
          .layoutWeight(1)
      }
    }
    .width('100%')
    .height('100%')
  }
}