class BannerClass {
  id: string = '';
  imageSrc: ResourceStr = '';
  url: string = '';

  constructor(id: string, imageSrc: ResourceStr, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}




@Entry
@Component
struct Index {
  @State message: string = '快速入门 ';

  build() {
    Column() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(20)
        .padding({
          top: 10,
          left: 10
        })
        .width('100%')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
      Banner()
      List(){

      }
      Row() {
        EnablementItem({
          title: 'HarmonyOS基础入门',
          brief: '为初学者提供全面的 HarmonyOS 入门指导。',
          image: $r('app.media.banner1')  // 第三张图片
        }).margin({
          left: 20,
          right: 10
        })
        EnablementItem({
          title: 'HarmonyOS UI 设计',
          brief: '学习如何设计 HarmonyOS 的用户界面。',
          image: $r('app.media.banner2')  // 第四张图片
        })
          .margin({
            left: 10,
            right: 10
          })
        EnablementItem({
          title: 'HarmonyOS UI 设计',
          brief: '学习如何设计 HarmonyOS 的用户界面。',
          image: $r('app.media.banner3')  // 第四张图片
        })
          .margin({
            left: 10,
            right: 20
          })
      }
      .margin({
        top:20
      })
      TutorialItem()
        .margin({
          top:20
        })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}
@Preview
@Component
struct TutorialItem {
  private title: string = 'Step1 快速入门介绍';
  private brief: string = '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序 。';
  build() {
    Row() {
      Column() {
        Text(this.title)
          .height(19)
          .width('100%')
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontWeight(400)
          .margin({ top: 4 })
        Text(this.brief)
          .height(32)
          .width('100%')
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor('rgba(0, 0, 0, 0.6)')
          .margin({ top: 5 })
      }
      .height('100%')
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ right: 12 })

      Image($r('app.media.banner1'))
        .objectFit(ImageFit.Cover)
        .height(64)
        .width(108)
        .borderRadius(16)
    }
    .width('100%')
    .height(88)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .padding(12)
    .alignItems(VerticalAlign.Top)
  }
}



@Preview
@Component
struct EnablementItem  {
  @Prop title: string = 'HarmonyOS第一课';
  @Prop brief: string = '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。';
  @Prop image: ResourceStr = $r('app.media.banner1'); // 默认图片路径，可以根据需要调整

  build() {
    Column() {
      Image(this.image)
        .width('100%')
        .objectFit(ImageFit.Cover)
        .height(96)
        .borderRadius({
          topLeft: 16,
          topRight: 16
        })
      Text(this.title)
        .height(19)
        .width('100%')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontWeight(400)
        .padding({ left: 12, right: 12 })
        .margin({ top: 8 })
      Text(this.brief)
        .height(32)
        .width('100%')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontWeight(400)
        .fontColor('rgba(0, 0, 0, 0.6)')
        .padding({ left: 12, right: 12 })
        .margin({ top: 2 })
    }
    .width(160)
    .height(169)
    .borderRadius(16)
    .backgroundColor(Color.White)
  }

}



@Preview
@Component
struct Banner {
 // 轮播的图片数组
  @State bannerList: Array<BannerClass> = [
    new BannerClass('pic0', $r('app.media.banner1'),
      'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
    new BannerClass('pic1', $r('app.media.banner2'),
      'https://developer.huawei.com/consumer/cn/'),
    new BannerClass('pic2', $r('app.media.banner3'),
      'https://developer.huawei.com/consumer/cn/deveco-studio/')
  ];

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass, index: number) => {
        Image(item.imageSrc)
          .objectFit(ImageFit.Contain)
          .width('100%')
          .height('30%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
      }, (item: BannerClass, index: number) => item.id)
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7'))
  }
}
