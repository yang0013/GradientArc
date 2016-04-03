//
//  StringConstants.h
//  Reader
//
//  Created by lisz on 9/4/12.
//  Copyright (c) 2012 Asia. All rights reserved.
//

#ifndef ____StringConstants_h
#define ____StringConstants_h

#define ScreenWidth self.view.frame.size.width
#define ScreenHeight self.view.frame.size.height
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

//#define XXYBaseThemeMainColor [UIColor colorWithRed:154.0/255.f green:224.0/255.f blue:196.0/255.f alpha:1.0]
#define XXYBaseThemeMainColor [UIColor colorWithRed:39.0/255.f green:188.0/255.f blue:128.0/255.f alpha:1.0]
#define XXYTextFieldPlaceholderColor [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0]
#define XXYProtmtLabelTextColor [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]
#define XXYTextFieldTextColor [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]
#define XXYLeftLabelTextColor [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]
#define XXYNavigateBarBackGroundColor [UIColor colorWithRed:44.0/255.f green:62.0/255.f blue:80.0/255.f alpha:1.0]
#define XXYViewBackgroundColor [UIColor colorWithRed:239.0/255.f green:239.0/255.f blue:244.0/255.f alpha:1.0]
#define XXYNavigateBarTextColor [UIColor whiteColor]
#define XXYFontFamilyName @"STHeitiSC-Light"

//测试
#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"<%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ... )
#endif

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define XXYTextFieldHeight  (((IS_IPHONE_6) || (IS_IPHONE_6P)) ? 54.0 : 44.0)
#define XXYButtonHeight (((IS_IPHONE_6) || (IS_IPHONE_6P)) ? 50.0 : 44.0)
#define XXYTextFieldPlaceHolderFontSize (((IS_IPHONE_6) || (IS_IPHONE_6P)) ? 17.0 : 14.0)
#define XXYTextFieldLeftMargin (((IS_IPHONE_6) || (IS_IPHONE_6P)) ? 105.0 : 95.0)

static NSString * const XXYUserIsLogin = @"isLogin";

// notification
static NSString * const XXYLoginDidChangeNotification = @"loginStateChange";
static NSString * const XXYCreditScoreDidChangeNotification = @"XXYCreditScoreDidChangeNotification";
static NSString * const XXYShouldShowHighOptionViewNotification = @"XXYShouldShowHighOptionViewNotification";

#endif