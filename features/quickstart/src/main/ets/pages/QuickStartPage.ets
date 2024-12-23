// features/quickstart/src/main/ets/pages/QuickStartPage.ets

import { Banner } from '../view/Banner';
import { EnablementView } from '../view/EnablementView';
import { TutorialView } from '../view/TutorialView';

// 注意这里移除了@Entry装饰，其不再作为一个页面使用
@Component
export struct QuickStartPage {
  @State message: string = '快速入门';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)
      Scroll() {
        Column() {
          Banner()
          EnablementView()
          TutorialView()
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}